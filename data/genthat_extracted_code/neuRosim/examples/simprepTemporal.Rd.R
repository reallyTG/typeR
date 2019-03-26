library(neuRosim)


### Name: simprepTemporal
### Title: Prepare temporal structure of the data
### Aliases: simprepTemporal
### Keywords: high-level

### ** Examples

ncond <- 2
os <- list(c(20,60),c(15,35))
d <- list(20, 10)
effect <- list(7,10)
total <- 80
TR <- 2
out <- simprepTemporal(total, onsets=os, durations=d, TR=TR, 
	effectsize=effect, hrf="double-gamma")
## Don't show: 
rm(os,d,total,TR,out)
## End(Don't show)



