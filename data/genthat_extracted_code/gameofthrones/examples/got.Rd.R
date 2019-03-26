library(gameofthrones)


### Name: gotMap
### Title: Game of Thrones Colour Map.
### Aliases: gotMap got got_pal gameofthrones

### ** Examples

library(ggplot2)
library(hexbin)

dat <- data.frame(x = rnorm(1e4), y = rnorm(1e4))

ggplot(dat, aes(x = x, y = y)) +
  geom_hex() + coord_fixed() +
  scale_fill_gradientn(colours = got(128, option = "targaryen")) +
  theme_minimal()

pal <- got(256, option = "Wildfire")
image(volcano, col = pal)




