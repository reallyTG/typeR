library(meboot)


### Name: meboot
### Title: Generate Maximum Entropy Bootstrapped Time Series Ensemble
### Aliases: meboot
### Keywords: ts

### ** Examples

    ## Ensemble for the AirPassenger time series data
    set.seed(345)
    out <- meboot(x=AirPassengers, reps=100, trim=0.10, elaps=TRUE)

    ## Ensemble for T=5 toy time series used in Vinod (2004)
    set.seed(345)
    out <- meboot(x=c(4, 12, 36, 20, 8), reps=999, trim=0.25, elaps=TRUE)
    mean(out$ens)  # ensemble mean should be close to sample mean 16
  


