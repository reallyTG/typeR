library(efflog)


### Name: exp_par
### Title: Fitting causal log-linear models without the multiplicative
###   interaction
### Aliases: exp_par

### ** Examples

tableXZY<-data.frame(expand.grid( 
 X=factor(c("0","1"),levels=c("0","1")), 
 Z=factor(c("0","1"),levels=c("0","1")), 
  Y=factor(c("0","1"),levels=c("0","1"))), 
 count=c(57,47,21,39,31,40,20,95))
exp_par(tableXZY)



