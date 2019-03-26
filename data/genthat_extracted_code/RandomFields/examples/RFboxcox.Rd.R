library(RandomFields)


### Name: RFboxcox
### Title: Linear part of 'RMmodel'
### Aliases: RFboxcox
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

data(soil)
str(soil)
soil <- RFspatialPointsDataFrame(
 coords = soil[ , c("x.coord", "y.coord")],
 data = soil[ , c("moisture", "NO3.N", "Total.N", "NH4.N", "DOC", "N20N")],
 RFparams=list(vdim=6, n=1)
)
dta <- soil["moisture"]
## Don't show: 
if (RFoptions()$internal$examples_red) {
  warning("data have been reduced !")
  All <- 1:7
  rm(soil)
  data(soil)
  soil <- RFspatialPointsDataFrame(
     coords = soil[All, c("x.coord", "y.coord")],
     data = soil[All, c("moisture", "NO3.N", "Total.N",
      "NH4.N", "DOC", "N20N")],
      RFparams=list(vdim=6, n=1)
  )
  dta <- soil["moisture"]
}
## End(Don't show)

model <- ~1 + RMplus(RMwhittle(scale=NA, var=NA, nu=NA), RMnugget(var=NA))

## Don't show: ## Not run: 
##D ## Assuming log-Gaussian Data
##D print(fit <- RFfit(model, data=dta, loggaus=TRUE))
## End(Not run)## End(Don't show)

## main Parameter in the Box Cox transformation to be estimated
print(fit <- RFfit(model, data=dta, boxcox=NA))

## Don't show: 
FinalizeExample()
## End(Don't show)


