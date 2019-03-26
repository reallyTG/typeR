library(FRAPO)


### Name: PMD
### Title: Most Diversified Portfolio
### Aliases: PMD
### Keywords: optimize

### ** Examples

data(MultiAsset)
Rets <- returnseries(MultiAsset, method = "discrete", trim = TRUE)
PMD(Rets)



