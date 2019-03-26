library(NPCirc)


### Name: temp.wind
### Title: Temperature and wind direction data
### Aliases: temp.wind
### Keywords: datasets

### ** Examples

data(temp.wind)
winddir <- temp.wind[,4] 
temp <- temp.wind[,3]
nas <- which(is.na(winddir))
winddir <- circular(winddir[-nas], units="degrees") 
temp <- temp[-nas]

est <- kern.reg.circ.lin(winddir, temp, t=NULL, bw=3.41, method="LL")
plot(est, plot.type="line", xlab="wind direction", ylab="temperature")
plot(est, plot.type="circle", points.plot=TRUE)



