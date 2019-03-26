library(gamlss)


### Name: Rsq
### Title: Generalised (Pseudo) R-squared for GAMLSS models
### Aliases: Rsq
### Keywords: regression

### ** Examples

data(aids)
m1 <- gamlss(y~x+qrt, data=aids, family=NBI)
Rsq(m1)
Rsq(m1, type="both")
rm(m1)



