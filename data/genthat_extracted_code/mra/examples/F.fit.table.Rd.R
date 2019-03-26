library(mra)


### Name: F.fit.table
### Title: F.fit.table - Produce a summary table of model fit statistics.
### Aliases: F.fit.table
### Keywords: survival models

### ** Examples


## Fit several CJS model to dipper data. Summarize fits.

## Time varying survival and capture (true CJS model)
data(dipper.histories)
ct <- as.factor( paste("T",1:ncol(dipper.histories), sep=""))
attr(ct,"nan")<-nrow(dipper.histories)
dipr.01 <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(ct,drop=c(1,6,7)), dipper.histories )

## Linear trend in survival
cT <- 1:ncol(dipper.histories)
dipr.02 <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(cT, nan=nrow(dipper.histories)), 
  dipper.histories )

## No trend in survival
dipr.03 <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~1, dipper.histories )

## Summary table
F.fit.table( ls(pat="^dipr") )





