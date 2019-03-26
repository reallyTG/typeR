library(lulcc)


### Name: roundSum
### Title: Round elements in matrix or data.frame rows
### Aliases: roundSum

### ** Examples


## Sibuyan Island

## load observed land use data and create demand scenario
obs <- ObsLulcRasterStack(x=sibuyan$maps,
                    pattern="lu",
                    categories=c(1,2,3,4,5),
                    labels=c("Forest","Coconut","Grass","Rice","Other"),
                    t=c(0,14))

dmd <- approxExtrapDemand(obs, tout=0:14)
apply(dmd, 1, sum)

## artificially perturb for illustration purposes
dmd <- dmd * runif(1)
apply(dmd, 1, sum)

## use roundSum to correct demand scenario
ncell <- length(which(!is.na(getValues(sibuyan$maps$lu_sib_1997))))
ncell
dmd <- roundSum(dmd, ncell=ncell)
apply(dmd, 1, sum)




