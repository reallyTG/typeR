library(costat)


### Name: plot.csFSS
### Title: Plot a 'csFSS' object.
### Aliases: plot.csFSS
### Keywords: ts

### ** Examples

#
# Create dummy data
#
x1 <- rnorm(32)
y1 <- rnorm(32)
#
# Find stationary combinations
# Note: we don't run this example in installation/package formation as
# it takes a long time. However, this precise command IS run in
# the help to findstysols
#
## Not run: ans <- findstysols(Nsims=100, tsx=x1, tsy=y1)
#
# Produce dendrogram
#
## Not run: plot(ans)
#
# Produce four pictures relating to solution 3 (can also do
# par(mfrow=c(2,2)) to make a nice 4 plot on one page.)
#
## Not run: plot(ans, solno=3)
#solno is  3 
#3 
#1: 



