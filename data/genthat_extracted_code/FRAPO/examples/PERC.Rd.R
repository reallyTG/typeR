library(FRAPO)


### Name: PERC
### Title: Equal risk contributed portfolios
### Aliases: PERC
### Keywords: optimize

### ** Examples

data(MultiAsset)
Rets <- returnseries(MultiAsset, method = "discrete", trim = TRUE,
                     percentage = TRUE)
V <- cov(Rets)
ERC <- PERC(V)
ERC
w <- Weights(ERC)
w * V 



