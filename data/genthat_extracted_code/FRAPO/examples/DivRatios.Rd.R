library(FRAPO)


### Name: DivMeasures
### Title: Diversification Measures
### Aliases: dr cr rhow
### Keywords: algebra

### ** Examples

data(MultiAsset)
Rets <- returnseries(MultiAsset, method = "discrete", trim = TRUE)
w <- Weights(PMD(Rets))
V <- cov(Rets)
DR <- dr(w, V)
CR <- cr(w, V)
RhoW <- rhow(w, V)
test <- 1 / sqrt(RhoW * (1 - CR) + CR)
all.equal(DR, test) 



