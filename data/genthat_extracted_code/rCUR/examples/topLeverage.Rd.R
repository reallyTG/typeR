library(rCUR)


### Name: topLeverage
### Title: Function to obtain indexes of the most influental features due
###   to leverage score
### Aliases: topLeverage

### ** Examples

data(STTm)
res <- CUR(STTm, 3, 31, 12)
topLeverage(res, top.n=10)



