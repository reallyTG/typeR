library(evd)


### Name: fbvpot
### Title: Maximum-likelihood Fitting of Bivariate Extreme Value
###   Distributions to Threshold Exceedances
### Aliases: fbvpot print.bvpot
### Keywords: models

### ** Examples

bvdata <- rbvevd(1000, dep = 0.5, model = "log")
u <- apply(bvdata, 2,  quantile, probs = 0.9)
M1 <- fbvpot(bvdata, u, model = "log")
M2 <- fbvpot(bvdata, u, "log", dep = 0.5)
anova(M1, M2)



