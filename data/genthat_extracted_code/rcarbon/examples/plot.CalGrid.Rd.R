library(rcarbon)


### Name: plot.CalGrid
### Title: Plot a summed probability distribution (from a CalGrid object)
### Aliases: plot.CalGrid

### ** Examples

data(euroevol)
mycaldates <- calibrate(euroevol[1:10,"C14Age"], euroevol[1:10,"C14SD"], normalised=FALSE)
myspd <- spd(mycaldates, timeRange=c(8000,2000))
plot(myspd) #ordinary plot using \code{plot.CalSPD}
plot(myspd$grid) #working plot using the internal CalGrid object



