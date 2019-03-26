library(FitARMA)


### Name: FitARMA
### Title: Fit ARMA/ARIMA using fast MLE algorithm
### Aliases: FitARMA
### Keywords: ts

### ** Examples

data(SeriesA) #in datasets()
out1<-FitARMA(SeriesA, c(1,0,1))
out1
coef(out1)
out2<-FitARMA(SeriesA, c(0,1,1))
out2
coef(out2)



