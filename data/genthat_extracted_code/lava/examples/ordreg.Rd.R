library(lava)


### Name: ordreg
### Title: Univariate cumulative link regression models
### Aliases: ordreg

### ** Examples

m <- lvm(y~x)
ordinal(m,K=3) <- ~y
d <- sim(m,100)
e <- ordreg(y~x,d)



