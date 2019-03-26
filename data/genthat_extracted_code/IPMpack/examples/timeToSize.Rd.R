library(IPMpack)


### Name: timeToSize
### Title: Projects how long it takes to get from a starting distribution
###   to a target continuous stage value.
### Aliases: timeToSize
### Keywords: ~kwd1 ~kwd2

### ** Examples

#note that with the "fake data" essentially either takes 
#forever or is immediate...
dff <- generateData()
startSizes <- rnorm(1000, 2.5, 1)
Pmatrix <- makeIPMPmatrix(minSize = 1.2*min(dff$size, na.rm=TRUE),
maxSize = 1.2*max(dff$size, na.rm=TRUE), 
growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))

rc <- timeToSize(startingSizes = startSizes, IPM = Pmatrix, endSize = 6, 
startingEnv = 1, maxT = 1000, propReach = 0.001)

names(rc)

par(mfrow=c(2,2), bty = "l")
## Make picture with lines for distribution of 
## population on different time points
matplot(Pmatrix@meshpoints, rc$ts.dist, type = "l", xlab = "size", 
ylab = "Number of individuals")

## Examine time elapsed for propReach to attain the chosen endSize
rc$time.reach

## Plot out the survivorship
plot(rc$survivorship, type = "l", #log = "y", 
xlab = "time step", ylab = "Probability original population survival", 
ylim = c(0,1), col = "gray")



