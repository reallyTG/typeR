library(TSA)


### Name: tsdiag.Arimax
### Title: Model Diagnostics for a Fitted ARIMAX Model
### Aliases: tsdiag.Arimax
### Keywords: methods

### ** Examples

data(color)
m1.color=arima(color,order=c(1,0,0))
tsdiag(m1.color,gof=15,omit.initial=FALSE)



