library(ggridges)


### Name: scale_cyclical
### Title: Create a discrete scale that cycles between values
### Aliases: scale_colour_cyclical scale_color_cyclical scale_fill_cyclical
###   scale_alpha_cyclical scale_linetype_cyclical scale_size_cyclical
###   cyclical_scale ScaleCyclical
### Keywords: datasets

### ** Examples

library(ggplot2)

# By default, scale_cyclical sets `guide = "none"`, i.e., no legend
# is drawn
ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges(scale = 4) +
  scale_fill_cyclical(values = c("#3030D0", "#9090F0"))

# However, legends can be turned on by setting `guide = "legend"`
ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges(scale = 4) +
  scale_fill_cyclical(values = c("#3030D0", "#9090F0"),
                      guide = "legend", name = "Fill colors",
                      labels = c("dark blue", "light blue"))

# Cyclical scales are also available for the various other aesthetics
ggplot(diamonds, aes(x = price, y = cut, fill = cut,
                     color = cut, size = cut,
                     alpha = cut, linetype = cut)) +
  geom_density_ridges(scale = 4, fill = "blue") +
  scale_fill_cyclical(values = c("blue", "green")) +
  scale_color_cyclical(values = c("black", "white")) +
  scale_size_cyclical(values = c(2, 1)) +
  scale_alpha_cyclical(values = c(0.4, 0.8)) +
  scale_linetype_cyclical(values = c(1, 2))




