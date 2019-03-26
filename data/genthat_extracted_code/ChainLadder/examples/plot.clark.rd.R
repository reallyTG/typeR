library(ChainLadder)


### Name: plot.clark
### Title: Plot Clark method residuals
### Aliases: plot.clark
### Keywords: aplot methods

### ** Examples


X <- GenIns
Y <- ClarkLDF(GenIns, maxage=Inf, G="weibull")
plot(Y)  # One obvious outlier, shapiro test flunked
X[4,4] <- NA  # remove the outlier
Z <- ClarkLDF(GenIns, maxage=Inf, G="weibull")
plot(Z)  # Q-Q plot looks good




