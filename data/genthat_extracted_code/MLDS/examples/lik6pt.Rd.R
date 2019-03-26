library(MLDS)


### Name: lik6pt
### Title: Compute Log Likelihood for 6-point Test
### Aliases: lik6pt
### Keywords: univar

### ** Examples


data(kk1)
x.df <- mlds(SwapOrder(kk1))
lik6pt(x.df, Get6pts(x.df, nrep = 1))




