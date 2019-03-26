library(gremlin)


### Name: gremlin-package
### Title: Mixed-Effects REML Incorporating Generalized Inverses
### Aliases: gremlin-package _PACKAGE

### ** Examples

  require(nadiv)
  Ainv <- makeAinv(Mrode3[-c(1:2), 1:3])$Ainv
  mod11 <- gremlinR(WWG11 ~ sex - 1,
random = ~ calf,
data = Mrode11,
ginverse = list(calf = Ainv),
Gstart = matrix(0.2), Rstart = matrix(0.4),
maxit = 10, v = 2)



