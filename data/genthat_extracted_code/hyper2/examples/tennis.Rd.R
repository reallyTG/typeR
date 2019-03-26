library(hyper2)


### Name: tennis
### Title: Match outcomes from repeated doubles tennis matches
### Aliases: tennis doubles doubles_noghost tennis_noghost doubles_ghost
###   tennis_ghost
### Keywords: datasets

### ** Examples

data(tennis)
dotchart(maxp(tennis))
eigen(maxp(tennis,give=TRUE,hessian=TRUE)$hessian,TRUE,TRUE)$values

maxp(tennis_ghost)




