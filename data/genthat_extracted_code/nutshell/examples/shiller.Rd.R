library(nutshell)


### Name: shiller
### Title: Shiller Home Price Index
### Aliases: shiller.index shiller.other.data
### Keywords: datasets

### ** Examples

data(shiller)
# loads shiller.index, shiller.other.data
# linear fit
hpi.lm <- lm(Real.Home.Price.Index~Year,data=shiller.index)
# plotting the fit
plot(shiller.index,pch=19,cex=0.3)
abline(reg=hpi.lm,lty=1)



