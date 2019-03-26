library(urca)


### Name: cajorls
### Title: OLS regression of VECM
### Aliases: cajorls
### Keywords: regression

### ** Examples

data(finland)
sjf <- finland
sjf.vecm <- ca.jo(sjf, ecdet = "none", type = "eigen", K = 2,
spec = "longrun", season = 4)
sjf.vecm.rls <- cajorls(sjf.vecm, r = 2)
summary(sjf.vecm.rls$rlm)
sjf.vecm.rls$beta



