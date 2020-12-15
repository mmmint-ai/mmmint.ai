

current_dir=$(shell pwd)
JEKYLL_VERSION=3.8.4

new:
	docker run --rm --volume="$(current_dir):/srv/jekyll" -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll new .

build:
	docker run --rm --volume="$(current_dir):/srv/jekyll" -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll build

serve: clean
	docker run --name mmmint --volume="$(current_dir):/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch

serve-drafts:
	docker run --name mmmint --volume="$(current_dir):/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --drafts

exec:
	docker exec -ti myblog /bin/sh

clean:
	docker rm -f mmmint