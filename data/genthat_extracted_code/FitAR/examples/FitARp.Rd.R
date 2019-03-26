library(FitAR)


### Name: FitARp
### Title: Fit subset ARp Models
### Aliases: FitARp
### Keywords: ts

### ** Examples

#First Example: Fit to AR(4) 
set.seed(3323)
phi<-c(2.7607,-3.8106,2.6535,-0.9238)
z<-SimulateGaussianAR(phi,1000)
#MLE using arima
ans1<-FitARp(z,4,MLEQ=TRUE)
ans1
coef(ans1)
#OLS
ans2<-FitARp(z,4,MLEQ=FALSE)
ans2
coef(ans2)

## Not run: 
##D #save time building package
##D #Second Example: Fit subset ARp model
##D z<-log(lynx)
##D #MLE
##D FitARp(z, c(1,2,4,7,10,11),MLEQ=TRUE)
##D #LS
##D FitARp(z, c(1,2,4,7,10,11),MLEQ=FALSE)
##D 
##D #Third Example: Use UBIC model selection to fit subset models
##D z<-log(lynx)
##D p<-SelectModel(z,ARModel="ARp")[[1]]$p
##D #MLE #error returned by arima
##D #ans1<-FitARp(z, p, MLEQ=TRUE)
##D #ans1
##D #LS
##D ans2<-FitARp(z, p, MLEQ=FALSE)
##D ans2
## End(Not run)



