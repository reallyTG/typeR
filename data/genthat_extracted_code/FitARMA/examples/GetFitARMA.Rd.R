library(FitARMA)


### Name: GetFitARMA
### Title: Fit ARMA(p,q) model to mean zero time series.
### Aliases: GetFitARMA
### Keywords: ts

### ** Examples

data(SeriesA)
z<-SeriesA-mean(SeriesA)
GetFitARMA(z, 1, 1)
w<-diff(z, differences=1)
GetFitARMA(w, 0, 1)



