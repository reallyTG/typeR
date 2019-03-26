library(ggpol)


### Name: geom_circle
### Title: Circles with pre-defined radii.
### Aliases: geom_circle stat_circle

### ** Examples

set.seed(22189)
df <- data.frame(x = sample(1:10, 3), y = sample(1:10, 3), 
                 r = sample(3:4, 3, replace = TRUE))

ggplot(df) + geom_circle(aes(x = x, y = y, r = r, fill = gl(3, 1))) +
  coord_fixed()



