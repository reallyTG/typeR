library(ghibli)


### Name: ghibli_palette
### Title: A Studio Ghibli palette generator
### Aliases: ghibli_palette
### Keywords: colors

### ** Examples

ghibli_palette("PonyoLight")
ghibli_palette("LaputaMedium")
ghibli_palette("SpiritedDark")
ghibli_palette("MarnieMedium2", 3)

# If you need more colours than normally found in a palette, you
# can use a continuous palette to interpolate between existing
# colours
pal <- ghibli_palette(21, name = "YesterdayLight", type = "continuous")



