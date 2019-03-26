library(FRAPO)


### Name: PGMV
### Title: Global Minimum Variance Portfolio
### Aliases: PGMV
### Keywords: optimize

### ** Examples

data(MultiAsset)
Rets <- returnseries(MultiAsset, method = "discrete", trim = TRUE)
PGMV(Rets)



