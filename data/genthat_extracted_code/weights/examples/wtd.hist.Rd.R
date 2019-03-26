library(weights)


### Name: wtd.hist
### Title: Weighted Histograms
### Aliases: wtd.hist
### Keywords: ~dplot ~hplot ~distribution ~weights

### ** Examples

var1 <- c(1:100)
wgt <- var1/mean(var1)
par(mfrow=c(2, 2))
wtd.hist(var1)
wtd.hist(var1, weight=wgt)
wtd.hist(var1, weight=var1)



