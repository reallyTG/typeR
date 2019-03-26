library(nlts)


### Name: portman.Q
### Title: Ljung-Box test for whiteness in a time series.
### Aliases: portman.Q
### Keywords: ts

### ** Examples


   data(plodia)

   portman.Q(sqrt(plodia), K = 10) 

   fit <- ar(sqrt(plodia)) 
   portman.Q(na.omit(fit$resid), K = 10) 



