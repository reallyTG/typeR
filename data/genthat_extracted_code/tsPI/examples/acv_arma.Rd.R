library(tsPI)


### Name: acv_arma
### Title: Compute a theoretical autocovariance function of ARMA process
### Aliases: acv_arma

### ** Examples


## Example from Brockwell & Davis (1991, page 92-94)
## also in help page of ARMAacf (from stats)
n <- 0:9
answer <- 2^(-n) * (32/3 + 8 * n) /(32/3)
acv <- acv_arma(c(1.0, -0.25), 1.0, 10)
all.equal(acv/acv[1], answer)




