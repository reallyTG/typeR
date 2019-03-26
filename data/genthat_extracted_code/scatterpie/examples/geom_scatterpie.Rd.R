library(scatterpie)


### Name: geom_scatterpie
### Title: geom_scatterpie
### Aliases: geom_scatterpie

### ** Examples

library(ggplot2)
d <- data.frame(x=rnorm(5), y=rnorm(5))
d$A <- abs(rnorm(5, sd=1))
d$B <- abs(rnorm(5, sd=2))
d$C <- abs(rnorm(5, sd=3))
ggplot() + geom_scatterpie(aes(x=x, y=y), data=d, cols=c("A", "B", "C")) + coord_fixed()



