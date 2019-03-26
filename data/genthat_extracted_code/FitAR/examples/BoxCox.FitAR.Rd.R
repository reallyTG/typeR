library(FitAR)


### Name: BoxCox.FitAR
### Title: Box-Cox Analysis for "FitAR" Objects
### Aliases: BoxCox.FitAR
### Keywords: ts

### ** Examples

## Not run: 
##D  #takes a few seconds
##D #lynx time series. ARp subset model.
##D out<-FitAR(lynx, c(1,2,4,10,11), ARModel="ARp")
##D BoxCox(out)
##D #
##D #lynx time series. ARz subset model.
##D p<-SelectModel(lynx, ARModel="ARz", lag.max=25, Best=1)
##D out<-FitAR(lynx, p)
##D BoxCox(out)
## End(Not run)




