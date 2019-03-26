library(FitARMA)


### Name: FitARMA-package
### Title: FitARMA: Fit ARMA or ARIMA using fast MLE algorithm
### Aliases: FitARMA-package
### Keywords: package ts

### ** Examples

data(SeriesA)
#ARIMA(0,1,1) with exact estimation of mean of differenced series
ans<-FitARMA(SeriesA, order=c(0,1,1), MeanMLEQ=TRUE)
ans
coef(ans)
#ARIMA(0,1,1) with sample-mean estimation of mean of differenced series
ans<-FitARMA(SeriesA, order=c(0,1,1))
ans
coef(ans)
#ARIMA(0,1,1) with mean of differenced series set to zero
#as in 'arima'
ans<-FitARMA(SeriesA, order=c(0,1,1), demean=FALSE)
ans
coef(ans)
# illustrating methods
summary(ans)
resid(ans)
fitted(ans)
ans$racf
#Simulate and fit Gaussian ARMA
z<-SimulateGaussianARMA(0.9, 0.5, 200)
#GetFitARMA is faster than FitARMA.
#Use GetFitARMA for parametric bootstrap and simulation experiments
GetFitARMA(z, p=1, q=1)




