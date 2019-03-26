library(egg)


### Name: symmetrise_scale
### Title: symmetrise_scale
### Aliases: symmetrise_scale

### ** Examples

library(ggplot2)
p1 <- qplot(mpg, wt, data=mtcars, colour=cyl) + facet_wrap(~carb, nrow=1, scales="free")
symmetrise_scale(p1, "y")



