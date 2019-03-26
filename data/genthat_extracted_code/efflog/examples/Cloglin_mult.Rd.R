library(efflog)


### Name: Cloglin_mult
### Title: Fitting a causal log-linear model with the multiplicative
###   interaction
### Aliases: Cloglin_mult

### ** Examples

tableXZY<-data.frame(expand.grid( 
 X=factor(c("0","1"),levels=c("0","1")), 
  Z=factor(c("0","1"),levels=c("0","1")), 
  Y=factor(c("0","1"),levels=c("0","1"))), 
  count=c(57,47,21,39,31,40,20,95))
Cloglin_mult(tableXZY)



