library(RandomFields)


### Name: soil
### Title: Soil data of North Bavaria, Germany
### Aliases: soil
### Keywords: datasets

### ** Examples
## Don't show: 
StartExample()
## End(Don't show) 
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

################################################################
## ##
## a geostatistical analysis that demonstrates ##
## features of the package 'RandomFields' ##
## ##
################################################################


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
  rm(soil) ## muss vorher entfernt werden, sonst funktioniert data(soil)
  ##          nicht sicher
  data(soil)
  All <- 1:7
  soil <- RFspatialPointsDataFrame(
     coords = soil[All, c("x.coord", "y.coord")],
     data = soil[All, c("moisture", "NO3.N", "Total.N",
      "NH4.N", "DOC", "N20N")],
      RFparams=list(vdim=6, n=1)
  )
  dta <- soil["moisture"]
}
## End(Don't show)

## plot the data first
colour <- rainbow(100)
plot(dta, col=colour)


## fit by eye
gui.model <- RFgui(dta) 
## Don't show: 
if (!interactive()) gui.model <- RMexp()
## End(Don't show) 

## fit by ML
model <- ~1 + RMwhittle(scale=NA, var=NA, nu=NA) + RMnugget(var=NA)
(fit <- RFfit(model, data=dta))
plot(fit, method=c("ml", "plain", "sqrt.nr", "sd.inv"),
     model = gui.model, col=1:8)

## Kriging ...
x <- seq(min(dta@coords[, 1]), max(dta@coords[, 1]), l=121)
k <- RFinterpolate(fit, x=x, y=x, data=dta)
plot(x=k, col=colour)
plot(x=k, y=dta, col=colour)

## what is the probability that at no point of the
## grid given by x and y the moisture is greater than 24 percent?
cs <- RFsimulate(model=fit@ml, x=x, y=x, data=dta, n=50)
plot(cs, col=colour)
plot(cs, y=dta, col=colour)
Print(mean(apply(as.array(cs) <= 24, 3, all))) ## about 40 percent ...

## Don't show: 
FinalizeExample()
## End(Don't show)


