library(hdrcde)


### Name: hdr
### Title: Highest Density Regions
### Aliases: hdr hdr.boxplot hdr.den hdr.den hdr.boxplot
### Keywords: distribution hplot smooth

### ** Examples


# Old faithful eruption duration times
hdr(faithful$eruptions)
hdr.boxplot(faithful$eruptions)
hdr.den(faithful$eruptions)

# Simple bimodal example
x <- c(rnorm(100,0,1), rnorm(100,5,1))
par(mfrow=c(1,2))
boxplot(x)
hdr.boxplot(x)
par(mfrow=c(1,1))
hdr.den(x)

# Highly skewed example
x <- exp(rnorm(100,0,1))
par(mfrow=c(1,2))
boxplot(x)
hdr.boxplot(x,lambda=0)




