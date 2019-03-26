library(urca)


### Name: ablrtest
### Title: Likelihood ratio test for restrictions on alpha and beta
### Aliases: ablrtest
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, spec="longrun",
season=4)
HD1 <- matrix(c(1, -1, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 1), c(5,3))
DA <- matrix(c(1,0,0,0, 0, 1, 0, 0, 0, 0, 0, 1), c(4,3))
summary(ablrtest(sjd.vecm, H=HD1, A=DA, r=1))



