library(fitdistrplus)


### Name: groundbeef
### Title: Ground beef serving size data set
### Aliases: groundbeef
### Keywords: datasets

### ** Examples

# (1) load of data
#
data(groundbeef)

# (2) description and plot of data
#
serving <- groundbeef$serving
descdist(serving)
plotdist(serving)

# (3) fit of a Weibull distribution to data
#
fitW <- fitdist(serving,"weibull")
summary(fitW)
plot(fitW)
gofstat(fitW)




