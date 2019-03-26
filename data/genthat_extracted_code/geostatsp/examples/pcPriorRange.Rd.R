library(geostatsp)


### Name: pcPriorRange
### Title: PC prior for range parameter
### Aliases: pcPriorRange pcPrior

### ** Examples

# pr(range < 100km) = 0.1, 200m grid cells 
	x = pcPriorRange(q=100*1000, p=0.1, cellSize = 200)
	rangeSeq = seq(0, 1000, len=1001)
	plot(rangeSeq, x$dprior$range(rangeSeq*1000)*1000, 
	  type='l', xlab="range, 1000's km", ylab='dens')
	cat(x$inla)



