library(ggforce)


### Name: geom_regon
### Title: Draw regular polygons by specifying number of sides
### Aliases: geom_regon stat_regon

### ** Examples

ggplot() +
  geom_regon(aes(x0 = runif(8), y0 = runif(8), sides = sample(3:10, 8),
                 angle = 0, r = runif(8) / 10)) +
  coord_fixed()

# The polygons are drawn with geom_shape, so can be manipulated as such
ggplot() +
  geom_regon(aes(x0 = runif(8), y0 = runif(8), sides = sample(3:10, 8),
                 angle = 0, r = runif(8) / 10),
             expand = unit(1, 'cm'), radius = unit(1, 'cm')) +
  coord_fixed()



