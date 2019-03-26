library(urca)


### Name: blrtest
### Title: Likelihood ratio test for restrictions on beta
### Aliases: blrtest
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm <- ca.jo(sjd, ecdet="const", type="eigen", K=2, spec="longrun",
season=4)
HD0 <- matrix(c(-1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1), c(5,4))
summary(blrtest(sjd.vecm, H=HD0, r=1))



