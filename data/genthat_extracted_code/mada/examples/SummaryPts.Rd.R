library(mada)


### Name: SummaryPts
### Title: Use the Zwindermann & Bossuyt (2008) MCMC procedure to generate
###   summary points (positive and negative likelihood ratio, diagnostic
###   odds ratio) for the Reitsma et al. (2005) bivariate model
### Aliases: SummaryPts SummaryPts.default SummaryPts.reitsma
###   print.SummaryPts summary.SummaryPts

### ** Examples

data(Dementia)
(fit <- reitsma(Dementia))
mcmc_sum <- SummaryPts(fit, n.iter = 10^3)
## n.iter should be larger in applications!
mcmc_sum #just the means
summary(mcmc_sum) # 95% CIs by default
summary(mcmc_sum, level = 0.80, digits = 5) ## more digits, smaller CIs

## Supplying other functions

# Example 1: theta parameter of proportional hazards model 
# see "phm" in mada's documentation for details on theta 
theta <- function(sens,fpr){log(sens) / log(fpr)}
theta_sum <- SummaryPts(fit, FUN = list(theta = theta), n.iter = 10^3)
## n.iter should be larger in applications!
summary(theta_sum)
# compare with phm:
summary(phm(Dementia)) # the two estimators almost agree in this example

# Example 2: Youden index
Youden <- function(sens, fpr){sens - fpr}
Youden_sum <- SummaryPts(fit, FUN = list(Youden = Youden), , n.iter = 10^3)
## n.iter should be larger in applications!
summary(Youden_sum)



