library(GDINA)


### Name: ClassRate
### Title: Classification Rate Evaluation
### Aliases: ClassRate

### ** Examples

## Not run: 
##D N <- 2000
##D # model does not matter if item parameter is probability of success
##D Q <- sim30GDINA$simQ
##D J <- nrow(Q)
##D gs <- matrix(0.1,J,2)
##D 
##D set.seed(12345)
##D sim <- simGDINA(N,Q,gs.parm = gs)
##D GDINA.est <- GDINA(sim$dat,Q)
##D 
##D CR <- ClassRate(sim$attribute,personparm(GDINA.est))
##D CR
## End(Not run)



