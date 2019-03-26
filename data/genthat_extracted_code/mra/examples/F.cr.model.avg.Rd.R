library(mra)


### Name: F.cr.model.avg
### Title: F.cr.model.avg - Model averaging of mark-recapture parameters.
### Aliases: F.cr.model.avg
### Keywords: survival models

### ** Examples



## Fit several CJS model to dipper data. Model average survival

## Time varying survival and capture (true CJS model)
data(dipper.histories)
ct <- as.factor( paste("T",1:ncol(dipper.histories), sep=""))
attr(ct,"nan")<-nrow(dipper.histories)
dipper.01 <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(ct,drop=c(1,6,7)), dipper.histories )

## Linear trend in survival
cT <- 1:ncol(dipper.histories)
dipper.02 <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(cT, nan=nrow(dipper.histories)), 
  dipper.histories )

## No trend in survival
dipper.03 <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~1, dipper.histories )

## Model average
mod.avg.surv <- F.cr.model.avg( ls(pat="^dipper.[0-9]"), what="s", fit.stat="aicc" )

mod.avg.n <- F.cr.model.avg( ls(pat="^dipper.[0-9]"), what="n", fit.stat="aicc" )

## Plot
plot(mod.avg.n)






