library(VCA)


### Name: getVCvar
### Title: Covariance-Matrix of Variance Components.
### Aliases: getVCvar

### ** Examples

## Not run: 
##D data(dataEP05A2_3)
##D res <- anovaVCA(y~day/run, dataEP05A2_3, SSQ.method="qf")
##D res
##D mat <- res$Matrices
##D Var <- VCA:::getVCvar(Ci=mat$Ci.SS, A=mat$A, Z=mat$Z, VC=res$aov.tab[-1,"VC"])
##D round(Var, 12)
## End(Not run)



