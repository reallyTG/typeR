library(ggforce)


### Name: geom_circle
### Title: Circles based on center and radius
### Aliases: geom_circle stat_circle

### ** Examples

# Lets make some data
circles <- data.frame(
  x0 = rep(1:3, 3),
  y0 = rep(1:3, each = 3),
  r = seq(0.1, 1, length.out = 9)
)

# Behold the some circles
ggplot() +
  geom_circle(aes(x0 = x0, y0 = y0, r = r, fill = r), data = circles)

# Use coord_fixed to ensure true circularity
ggplot() +
  geom_circle(aes(x0 = x0, y0 = y0, r = r, fill = r), data = circles) +
  coord_fixed()




