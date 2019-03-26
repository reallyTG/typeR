library(highfrequency)


### Name: rMarginal
### Title: Maginal Contribution to Realized Estimate
### Aliases: rMarginal
### Keywords: methods

### ** Examples

data(sbux.xts)
par(mfrow=c(2,1))
plot(rCumSum(sbux.xts, period=10, align.by="seconds", align.period=60), 
   xlab="", ylab="Cumulative Ruturns", main="Starbucks (SBUX)",
    sub='20110701', type="p")
barplot(rMarginal(sbux.xts, period=10, align.by="seconds", align.period=60)$y,
    main="Marginal Contribution Plot") 



