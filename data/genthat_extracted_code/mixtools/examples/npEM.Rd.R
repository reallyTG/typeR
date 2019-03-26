library(mixtools)


### Name: npEM
### Title: Nonparametric EM-like Algorithm for Mixtures of Independent
###   Repeated Measurements
### Aliases: npEM npEMindrep npEMindrepbw
### Keywords: file

### ** Examples

## Examine and plot water-level task data set.

## First, try a 3-component solution where no two coordinates are
## assumed i.d.
data(Waterdata)
set.seed(100)
## Not run: 
##D a <- npEM(Waterdata[,3:10], mu0=3, bw=4) # Assume indep but not iid
##D plot(a) # This produces 8 plots, one for each coordinate
## End(Not run)

## Next, same thing but pairing clock angles that are directly opposite one
## another (1:00 with 7:00, 2:00 with 8:00, etc.)
## Not run: 
##D b <- npEM(Waterdata[,3:10], mu0=3, blockid=c(4,3,2,1,3,4,1,2), bw=4) # iid in pairs
##D plot(b) # Now only 4 plots, one for each block
## End(Not run)



