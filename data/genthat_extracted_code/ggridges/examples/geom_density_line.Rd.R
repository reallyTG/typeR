library(ggridges)


### Name: geom_density_line
### Title: Smoothed density estimates drawn with a ridgeline rather than
###   area
### Aliases: geom_density_line GeomDensityLine
### Keywords: datasets

### ** Examples

library(ggplot2)
ggplot(diamonds, aes(carat)) +
  geom_density_line()

ggplot(diamonds, aes(carat)) +
  geom_density_line(adjust = 1/5)
ggplot(diamonds, aes(carat)) +
  geom_density_line(adjust = 5)

ggplot(diamonds, aes(depth, colour = cut)) +
  geom_density_line(alpha = 0.5) +
  xlim(55, 70)
ggplot(diamonds, aes(depth, fill = cut, colour = cut)) +
  geom_density_line(alpha = 0.1) +
  xlim(55, 70)



