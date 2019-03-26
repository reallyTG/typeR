library(egg)


### Name: tag_facet
### Title: tag_facet
### Aliases: tag_facet

### ** Examples

library(ggplot2)
mydf = data.frame(
  x = 1:90,
  y = rnorm(90),
  red = rep(letters[1:3], 30),
  blue = c(rep(1, 30), rep(2, 30), rep(3, 30)))

p <- ggplot(mydf) +
  geom_point(aes(x = x, y = y)) +
  facet_wrap(
    ~ red + blue)
tag_facet(p)



