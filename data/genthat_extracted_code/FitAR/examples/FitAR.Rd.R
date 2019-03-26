library(FitAR)


### Name: FitAR
### Title: Fit AR, ARp and ARz
### Aliases: FitAR
### Keywords: ts

### ** Examples

#First example: fit exact MLE to AR(4) 
set.seed(3323)
phi<-c(2.7607,-3.8106,2.6535,-0.9238)
z<-SimulateGaussianAR(phi,1000)
ans<-FitAR(z,4,MeanMLEQ=TRUE)
ans
coef(ans)

## Not run: 
##D  #save time building package!
##D #Second example: compare with sample mean result
##D ans<-FitAR(z,4)
##D coef(ans)
##D 
##D #Third example: fit subset ARz and ARp models
##D z<-log(lynx)
##D FitAR(z, c(1,2,4,7,10,11))
##D #now obtain exact MLE for Mean as well
##D FitAR(z, c(1,2,4,7,10,11), MeanMLE=TRUE)
##D #subset ARp using exact MLE
##D FitAR(z, c(1,2,4,7,10,11), ARModel="ARp", MLEQ=TRUE)
##D #subset ARp using LS
##D FitAR(z, c(1,2,4,7,10,11), ARModel="ARp", MLEQ=FALSE)
##D #or
##D FitAR(z, c(1,2,4,7,10,11), ARModel="ARp")
##D 
##D 
##D #Fourth example: use UBIC model selection to fit subset models
##D z<-log(lynx)
##D #ARz case
##D p<-SelectModel(z,ARModel="ARz")[[1]]$p
##D ans1<-FitAR(z, p)
##D ans1
##D ans1$ARModel
##D 
##D #ARp case
##D p<-SelectModel(z,ARModel="ARp")[[1]]$p
##D ans2<-FitAR(z, p, ARModel="ARp")
##D ans2
##D ans2$ARModel
##D 
##D #Fifth example: fit a full AR(p) using AIC/BIC methods
##D z<-log(lynx)
##D #BIC
##D p<-SelectModel(z,ARModel="AR")[1,1]
##D ans1<-FitAR(z, p)
##D ans1
##D #AIC
##D p<-SelectModel(z, ARModel="AR", Criterion="AIC")[1,1]
##D ans2<-FitAR(z, p)
##D ans2
## End(Not run)

#Sixth Example: Subset autoregression depends on lag.max!
#Because least-squares is used, P=lag.max observations are
#  are deleted. This causes different results depending on lag.max.
#This phenomenon does not happen with "ARz" subset models
#ARp models depend on lag.max
SelectModel(z,lag.max=15,ARModel="ARp", Criterion="BIC", Best=1)
SelectModel(z,lag.max=20,ARModel="ARp", Criterion="BIC", Best=1)
#ARz models do NOT depend in this way on lag.max.
#Obviously if some lags beyond the initial value of lag.max are
# found to be important, then there is a dependence but this
# is not a problem!
SelectModel(z,lag.max=15,ARModel="ARz", Criterion="BIC", Best=1)
SelectModel(z,lag.max=20,ARModel="ARz", Criterion="BIC", Best=1)



