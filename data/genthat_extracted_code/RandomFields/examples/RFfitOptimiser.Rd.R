library(RandomFields)


### Name: RFfitoptimiser
### Title: Optimisers for fitting model parameters to spatial data
### Aliases: RFfitoptimiser RFfitOptimiser
### Keywords: spatial optimize

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Not run: 
##D ## Here some alternative optimisers to 'optim' are considered.
##D ## All but the \pkg{nloptr} algorithms are largely slower than 'optim'.
##D ## Only a few of them return results as good as 'optim'.
##D 
##D data(soil)
##D str(soil)
##D soil <- RFspatialPointsDataFrame(
##D  coords = soil[ , c("x.coord", "y.coord")],
##D  data = soil[ , c("moisture", "NO3.N", "Total.N", "NH4.N", "DOC", "N20N")],
##D  RFparams=list(vdim=6, n=1)
##D )
##D dta <- soil["moisture"]
##D \dontshow{if (RFoptions()$internal$examples_red) {
##D   warning("data have been reduced !")
##D   All <- 1:7 
##D   rm(soil)
##D   data(soil)
##D   soil <- RFspatialPointsDataFrame(
##D      coords = soil[All, c("x.coord", "y.coord")],
##D      data = soil[All, c("moisture", "NO3.N", "Total.N",
##D       "NH4.N", "DOC", "N20N")],
##D       RFparams=list(vdim=6, n=1)
##D   )
##D   dta <- soil["moisture"]
##D }}
##D 
##D model <- ~1 + RMwhittle(scale=NA, var=NA, nu=NA) + RMnugget(var=NA)
##D \dontshow{if (RFoptions()$internal$examples_red){model<-~1+RMwhittle(scale=NA,var=NA,nu=1/2)}}
##D ## standard optimiser 'optim'
##D print(system.time(fit <- RFfit(model, data=dta)))
##D print(fit)
##D 
##D opt <- "optimx" #  30 sec; better result
##D print(system.time(fit2 <- try(RFfit(model, data=dta, optimiser=opt))))
##D print(fit2)
##D 
##D \dontshow{\dontrun{ ##D 
##D opt <- "soma" #  450 sec ##D 
##D print(system.time(fit2 <- try(RFfit(model, data=dta, optimiser=opt))))
##D print(fit2)
##D }}
##D 
##D opt <- "minqa" # 330 sec ##D 
##D print(system.time(fit2 <- try(RFfit(model, data=dta, optimiser=opt))))
##D print(fit2)
##D 
##D 
##D opt <- "nloptr"
##D algorithm <- RC_NLOPTR_NAMES
##D \dontshow{if(!interactive()) algorithm <- RC_NLOPTR_NAMES[1]}
##D for (i in 1:length(algorithm)) { ##D 
##D   print(algorithm[i])
##D   print(system.time(fit2 <- try(RFfit(model, data=dta, optimiser=opt,
##D                                     algorithm=algorithm[i]))))
##D   print(fit2)
##D }
##D 
##D 
##D 
##D if (interactive()) {
##D ## the following two optimisers are too slow to be run on CRAN.
##D 
##D opt <- "pso" # 600 sec
##D print(system.time(fit2 <- try(RFfit(model, data=dta, optimiser=opt))))
##D print(fit2)
##D 
##D opt <- "GenSA" #  10^4 sec
##D print(system.time(fit2 <- try(RFfit(model, data=dta, optimiser=opt))))
##D print(fit2)
##D }
## End(Not run)

## Don't show: 
RFoptions(modus_operandi="normal")
## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


