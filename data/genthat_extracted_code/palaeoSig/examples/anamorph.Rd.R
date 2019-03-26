library(palaeoSig)


### Name: anamorph
### Title: Anamorph
### Aliases: anamorph
### Keywords: manip

### ** Examples

set.seed(666)
x <- c(rnorm(50, 0, 1), rnorm(50, 6, 1))
hist(x)
ana.fun <- anamorph(x, 30, plot = TRUE)
xg <- ana.fun$xtog(x)
qqnorm(xg)
qqline(xg)
all.equal(x, ana.fun$gtox(xg))



