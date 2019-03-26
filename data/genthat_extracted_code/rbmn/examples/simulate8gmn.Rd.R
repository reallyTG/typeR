library(rbmn)


### Name: simulate8gmn
### Title: simulates a multinormal vector with varying expectation
### Aliases: simulate8gmn

### ** Examples

 loi <- list(mu=c(D=2, E=4), 
 rho=matrix(1:6, 2, dimnames=list(LETTERS[4:5], 
 LETTERS[1:3])), 
 gamma=matrix(c(1, 1, 1, 2), 2));
 cova <- matrix(runif(36), 12, dimnames=list(NULL, LETTERS[1:3]));
 print(simulate8gmn(loi, cova, 12));



