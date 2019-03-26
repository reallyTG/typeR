library(harrypotter)


### Name: hp
### Title: Harry Potter Colour Map.
### Aliases: hp hp_pal harrypotter

### ** Examples

library(ggplot2)
library(hexbin)

dat <- data.frame(x = rnorm(1e4), y = rnorm(1e4))
ggplot(dat, aes(x = x, y = y)) +
  geom_hex() +
  coord_fixed() +
  scale_fill_gradientn(colours = hp(128, option = 'Always'))

pal <- hp(256, option = "Ravenclaw")
image(volcano, col = pal)




