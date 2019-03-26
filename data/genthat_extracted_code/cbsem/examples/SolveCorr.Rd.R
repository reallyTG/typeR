library(cbsem)


### Name: SolveCorr
### Title: 'SolveCorr' Solve the Vale-Maurelli cubic equation to find the
###   intermediate correlation between two normal variables that gives rise
###   to a target correlation (rho) between the two transformed nonnormal
###   variables.
### Aliases: SolveCorr

### ** Examples

rho <- 0.5
coef1<-  c( 0.90475830, 0.14721082, 0.02386092)   
coef2<-  c( 0.90475830, 0.14721082, 0.02386092)   
r <- SolveCorr(rho, coef1, coef2) 




