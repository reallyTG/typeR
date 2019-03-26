library(spatstat)


### Name: methods.zclustermodel
### Title: Methods for Cluster Models
### Aliases: methods.zclustermodel pcfmodel.zclustermodel
###   predict.zclustermodel print.zclustermodel
### Keywords: spatial models

### ** Examples

  m <- zclustermodel("Thomas", kappa=10, mu=5, scale=0.1)
  m2 <- zclustermodel("VarGamma", kappa=10, mu=10, scale=0.1, nu=0.7)
  m
  m2
  g <- pcfmodel(m)
  g(0.2)
  g2 <- pcfmodel(m2)
  g2(1)
  Z <- predict(m, locations=square(2))
  Z2 <- predict(m2, locations=square(1))
  varcount(m, square(1))
  varcount(m2, square(1))



