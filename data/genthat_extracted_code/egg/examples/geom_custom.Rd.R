library(egg)


### Name: geom_custom
### Title: geom_custom
### Aliases: geom_custom

### ** Examples

library(grid)
d <- data.frame(x=rep(1:3, 4), f=rep(letters[1:4], each=3))
gl <- replicate(4, matrix(sample(palette(), 9, TRUE), 3, 3), FALSE)
dummy <- data.frame(f=letters[1:4], data = I(gl))

ggplot(d, aes(f,x)) +
  facet_wrap(~f)+
  theme_bw() +
  geom_point()+
  geom_custom(data = dummy, aes(data = data, y = 2),
              grob_fun = function(x) rasterGrob(x, interpolate = FALSE,
                                                width=unit(1,"cm"),
                                                height=unit(1,"cm")))



