library(bigsplines)


### Name: binsamp
### Title: Bin-Samples Strategic Knot Indices
### Aliases: binsamp

### ** Examples

##########   EXAMPLE 1   ##########

# create 2-dimensional predictor (both continuous)
set.seed(123)
xmat <- cbind(runif(10^6),runif(10^6))

# Default use:
#   10 marginal bins for each predictor
#   sample 1 observation from each subregion
xind <- binsamp(xmat)

# get the corresponding knots
bknots <- xmat[xind,]

# compare to randomly-sampled knots
rknots <- xmat[sample(1:(10^6),100),]
par(mfrow=c(1,2))
plot(bknots,main="bin-sampled")
plot(rknots,main="randomly sampled")



##########   EXAMPLE 2   ##########

# create 2-dimensional predictor (continuous and nominal)
set.seed(123)
xmat <- cbind(runif(10^6),sample(1:3,10^6,replace=TRUE))

# use 10 marginal bins for x1 and 3 marginal bins for x2 
# and sample one observation from each subregion
xind <- binsamp(xmat,nmbin=c(10,3))

# get the corresponding knots
bknots <- xmat[xind,]

# compare to randomly-sampled knots
rknots <- xmat[sample(1:(10^6),30),]
par(mfrow=c(1,2))
plot(bknots,main="bin-sampled")
plot(rknots,main="randomly sampled")



##########   EXAMPLE 3   ##########

# create 3-dimensional predictor (continuous, continuous, nominal)
set.seed(123)
xmat <- cbind(runif(10^6),runif(10^6),sample(1:2,10^6,replace=TRUE))

# use 10 marginal bins for x1 and x2, and 2 marginal bins for x3 
# and sample one observation from each subregion
xind <- binsamp(xmat,nmbin=c(10,10,2))

# get the corresponding knots
bknots <- xmat[xind,]

# compare to randomly-sampled knots
rknots <- xmat[sample(1:(10^6),200),]
par(mfrow=c(2,2))
plot(bknots[1:100,1:2],main="bin-sampled, x3=1")
plot(bknots[101:200,1:2],main="bin-sampled, x3=2")
plot(rknots[rknots[,3]==1,1:2],main="randomly sampled, x3=1")
plot(rknots[rknots[,3]==2,1:2],main="randomly sampled, x3=2")




