library(urca)


### Name: cajools
### Title: OLS regression of VECM
### Aliases: cajools
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm1 <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, spec="longrun",
season=4)
sjd.vecm2 <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, spec="transitory",
season=4)
sjd.vecm.ols1 <- cajools(sjd.vecm1)
sjd.vecm.ols2 <- cajools(sjd.vecm2)
summary(sjd.vecm.ols1)
summary(sjd.vecm.ols2)



