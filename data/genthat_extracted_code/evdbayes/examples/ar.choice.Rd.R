library(evdbayes)


### Name: Accept Rate
### Title: Compute Suited Proposal Standard Deviations
### Aliases: ar.choice
### Keywords: htest

### ** Examples

data(rainfall)
prrain <- prior.quant(shape = c(38.9, 7.1, 47), scale = c(1.5, 6.3,
  2.6))
n <- 10000; t0 <- c(43.2, 7.64, 0.32);
s <- ar.choice(init = t0, prior = prrain, lh = "pp", data = rainfall,
  thresh = 40, noy = 54, psd = rep(0.01, 3))
##Alec Stephenson choose suited psd = c(2, .2, .07) which is really
##close to values computed by ``ar.choice'' 



