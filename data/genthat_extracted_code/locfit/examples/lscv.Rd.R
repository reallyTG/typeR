library(locfit)


### Name: lscv
### Title: Least Squares Cross Validation Statistic.
### Aliases: lscv
### Keywords: htest

### ** Examples

# approximate calculation for a kernel density estimate
data(geyser, package="locfit")
lscv(~lp(geyser,h=1,deg=0), ev=lfgrid(100,ll=1,ur=6), kern="gauss")
# same computation, exact
lscv(lp(geyser,h=1),exact=TRUE)



