library(tsDyn)


### Name: fevd
### Title: Forecast Error Variance Decomposition
### Aliases: fevd fevd.nlVar
### Keywords: regression

### ** Examples

data(zeroyld)
mod_vecm <- VECM(zeroyld, lag = 2)
fevd(mod_vecm, n.ahead = 5)



