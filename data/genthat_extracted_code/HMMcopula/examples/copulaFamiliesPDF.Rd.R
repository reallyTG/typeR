library(HMMcopula)


### Name: copulaFamiliesPDF
### Title: COPULAPDF Probability density function for a copula. COPULAPDF
###   probability density function for a copula with linear correlation
###   parameters RHO and
### Aliases: copulaFamiliesPDF
### Keywords: internal

### ** Examples

 u = seq(0,1,0.1);
    U1=matrix(rep(u,length(u)),nrow=length(u),byrow = TRUE); U2=t(U1)
   F = copulaFamiliesPDF('clayton',cbind(c(U1), c(U2)),1)




