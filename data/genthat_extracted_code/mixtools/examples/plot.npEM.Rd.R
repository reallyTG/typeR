library(mixtools)


### Name: plot.npEM
### Title: Plot Nonparametric or Semiparametric EM Output
### Aliases: plot.npEM plot.spEM
### Keywords: file

### ** Examples
 
## Examine and plot water-level task data set.

## First, try a 3-component solution where no two coordinates are
## assumed i.d.
data(Waterdata)
set.seed(100)
## Not run: 
##D a <- npEM(Waterdata[,3:10], 3, bw=4)
##D par(mfrow=c(2,4))
##D plot(a) # This produces 8 plots, one for each coordinate
## End(Not run)

## Not run: 
##D ## Next, same thing but pairing clock angles that are directly opposite one
##D ## another (1:00 with 7:00, 2:00 with 8:00, etc.)
##D b <- npEM(Waterdata[,3:10], 3, blockid=c(4,3,2,1,3,4,1,2), bw=4)
##D par(mfrow=c(2,2))
##D plot(b) # Now only 4 plots, one for each block
## End(Not run)




