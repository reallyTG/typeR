library(extRemes)


### Name: Rsum
### Title: Hurricane Frequency Dataset.
### Aliases: Rsum
### Keywords: datasets

### ** Examples


data(Rsum)
str(Rsum)
plot(Rsum)

# Reproduce Fig. 1 of Katz (2002).
plot(	Rsum[,"Year"], Rsum[,"TDam"]/1000, type="h", xlab="Year",
	ylab="Total damage (billion U.S. dollars)",
	ylim=c(0,80), lwd=2)

# Reproduce Fig. 2 of Katz (2002).
plot(Rsum[,"Year"],Rsum[,"Ct"],type="h", xlab="Year",
    ylab="Number of Hurricanes", ylim=c(0,5), lwd=2)




