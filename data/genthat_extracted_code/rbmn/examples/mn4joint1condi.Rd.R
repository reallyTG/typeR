library(rbmn)


### Name: mn4joint1condi
### Title: computes a joint distribution from a marginal and a conditional
###   one for multinormal distributions
### Aliases: mn4joint1condi

### ** Examples

 lcon <- list(a=c(D=2, E=4), 
 b=matrix(1:6, 2, dimnames=list(LETTERS[4:5], 
 LETTERS[1:3])), 
 S=matrix(c(1, 1, 1, 2), 2));

 print8mn(mn4joint1condi(rbmn0mn.01, lcon));



