library(wesanderson)


### Name: wes_palette
### Title: A Wes Anderson palette generator
### Aliases: wes_palette
### Keywords: colors

### ** Examples

wes_palette("Royal1")
wes_palette("GrandBudapest1")
wes_palette("Cavalcanti1")
wes_palette("Cavalcanti1", 3)

# If you need more colours than normally found in a palette, you
# can use a continuous palette to interpolate between existing
# colours
pal <- wes_palette(21, name = "Zissou1", type = "continuous")
image(volcano, col = pal)



