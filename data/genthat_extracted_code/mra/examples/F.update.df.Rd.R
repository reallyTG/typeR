library(mra)


### Name: F.update.df
### Title: F.update.df - Update degrees of freedom in a Cormack-Jolly-Seber
###   fitted object
### Aliases: F.update.df
### Keywords: survival models

### ** Examples



## Fit CJS model to dipper data, time-varying capture and survivals.
data(dipper.histories)
ct <- as.factor( paste("T",1:ncol(dipper.histories), sep=""))
attr(ct,"nan")<-nrow(dipper.histories)
dipper.cjs <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(ct,drop=c(1,6,7)), dipper.histories )

## Update the degrees of freedom
dipper.cjs <- F.update.df( dipper.cjs, -1 )




