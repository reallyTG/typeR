library(ReIns)


### Name: ExcessGPD
### Title: Estimates for excess-loss premiums using GPD-MLE estimates
### Aliases: ExcessGPD

### ** Examples

data(secura)

# GPDmle estimator
mle <- GPDmle(secura$size)

# Premium of excess-loss insurance with retention R
R <- 10^7
ExcessGPD(secura$size, gamma=mle$gamma, sigma=mle$sigma, R=R, ylim=c(0,2*10^4))



