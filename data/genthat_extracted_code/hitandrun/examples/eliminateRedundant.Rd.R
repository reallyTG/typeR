library(hitandrun)


### Name: eliminateRedundant
### Title: Eliminate redundant linear constraints
### Aliases: eliminateRedundant
### Keywords: constraint

### ** Examples

constr <- list(
  constr = rbind(
    c(-1  ,  0),
    c( 0  , -1),
    c( 1  ,  1),
    c( 0.5, -1)),
  dir = c('<=', '<=', '=', '<='),
  rhs = c(0, 0, 1, 0))

constr <- eliminateRedundant(constr)

stopifnot(nrow(constr$constr) == 3) # eliminates one constraint



