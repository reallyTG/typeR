library(RandomFields)


### Name: RFratiotest
### Title: Likelihood ratio test
### Aliases: RFratiotest print.RFratiotest
### Keywords: spatial htest

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
## Don't show: ## Not run: 
##D RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##D ##                   RFoptions(seed=NA) to make them all random again
##D 
##D data(soil)  ## see also ?soil
##D soil <- RFspatialPointsDataFrame(
##D  coords = soil[, c("x.coord", "y.coord")],
##D  data = soil[, c("moisture", "NO3.N", "Total.N",
##D  "NH4.N", "DOC", "N20N")],
##D  RFparams=list(vdim=6, n=1)
##D  )
##D 
##D model <- ~1 + RMplus(RMwhittle(scale=NA, var=NA, nu=NA), RMnugget(var=NA))
##D submodel <- ~1 + RMplus(RMwhittle(scale=NA, var=NA, nu=NA), RMnugget(var=0))
##D 
##D RFratiotest(submodel, model, data=soil["moisture"],
##D             modus_operandi="sloppy")
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


