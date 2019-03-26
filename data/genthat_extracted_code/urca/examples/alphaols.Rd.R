library(urca)


### Name: alphaols
### Title: OLS regression of VECM weighting matrix
### Aliases: alphaols
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm1 <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, spec="longrun",
season=4)
summary(alphaols(sjd.vecm1))
summary(alphaols(sjd.vecm1, reg.number=1))



