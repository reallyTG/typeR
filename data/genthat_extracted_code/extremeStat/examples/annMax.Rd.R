library(extremeStat)


### Name: annMax
### Title: annual discharge maxima (streamflow)
### Aliases: annMax
### Keywords: datasets

### ** Examples


data(annMax)
str(annMax)
str(annMax)
plot(1976:2010, annMax, type="l", las=1, main="annMax dataset from Austria")
# Moving Average with different window widths:
berryFunctions::movAvLines(annMax, x=1976:2010, lwd=3, alpha=0.7)




