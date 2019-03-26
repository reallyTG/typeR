library(tgp)


### Name: dopt.gp
### Title: Sequential D-Optimal Design for a Stationary Gaussian Process
### Aliases: dopt.gp
### Keywords: design spatial optimize

### ** Examples

#
# 2-d Exponential data
# (This example is based on random data.  
# It might be fun to run it a few times)
#

# get the data
exp2d.data <- exp2d.rand()
X <- exp2d.data$X; Z <- exp2d.data$Z
Xcand <- exp2d.data$XX

# find a treed sequential D-Optimal design 
# with 10 more points
dgp <- dopt.gp(10, X, Xcand)

# plot the d-optimally chosen locations
# Contrast with locations chosen via
# the tgp.design function
plot(X, pch=19, xlim=c(-2,6), ylim=c(-2,6))
points(dgp$XX)



