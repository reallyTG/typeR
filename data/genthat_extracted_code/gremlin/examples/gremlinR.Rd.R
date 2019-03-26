library(gremlin)


### Name: gremlinR
### Title: Mixed-effect modeling functions.
### Aliases: gremlinR gremlin mkModMats

### ** Examples

  library(nadiv)
  Ainv <- makeAinv(Mrode3[-c(1:2), 1:3])$Ainv
  mod11 <- gremlinR(WWG11 ~ sex - 1,
  	random = ~ calf,
  	data = Mrode11,
  	ginverse = list(calf = Ainv),
  	Gstart = matrix(0.2), Rstart = matrix(0.4),
  	maxit = 10, v = 2)

  is(mod11)



