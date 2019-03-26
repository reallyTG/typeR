library(asremlPlus)


### Name: angular
### Title: Applies the angular transformation to proportions.
### Aliases: angular
### Keywords: manip

### ** Examples

n <-25
y <- rbinom(10, n, 0.5)
y <- c(y,0,n)
p <- y/n
p.ang <- angular(p, n)



