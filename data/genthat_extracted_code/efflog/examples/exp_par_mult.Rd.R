library(efflog)


### Name: exp_par_mult
### Title: Fitting causal log-linear model
### Aliases: exp_par_mult

### ** Examples

tableXZY<-data.frame(expand.grid( 
 X=factor(c("0","1"),levels=c("0","1")), 
  Z=factor(c("0","1"),levels=c("0","1")), 
 Y=factor(c("0","1"),levels=c("0","1"))), 
 count=c(57,47,21,39,31,40,20,95))
exp_par_mult(tableXZY)



