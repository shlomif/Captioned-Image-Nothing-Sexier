SVG = friends--yeah-like-i-could-lose-it.svg
PNG = $(SVG).png
JPEG = $(SVG).jpg
WEBP = $(SVG).webp

WIDTH = 600

all: $(PNG) $(JPEG) $(WEBP)

$(PNG): $(SVG)
	inkscape --export-png=$@ --export-width=$(WIDTH) $<

$(WEBP): $(PNG)
	gm convert $< $@

$(JPEG): $(PNG)
	gm convert $< $@

upload: all
	rsync --progress -v -a --inplace $(PNG) $(SVG) $(WEBP) *.jpg $(__HOMEPAGE_REMOTE_PATH)/friends--yeah-like-i-could-lose-it/
