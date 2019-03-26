library(darts)


### Name: darts-package
### Title: Statistical Tools to Analyze Your Darts Game
### Aliases: darts-package darts
### Keywords: package

### ** Examples

# An example of how to use this package to calculate my variance, and 
# then generate a personalized heatmap instructing me where to aim

# Start with 100 scores from throws aimed at the center of the board  
x = c(12,16,19,3,17,1,25,19,17,50,18,1,3,17,2,2,13,18,16,2,25,5,5,
1,5,4,17,25,25,50,3,7,17,17,3,3,3,7,11,10,25,1,19,15,4,1,5,12,17,16,
50,20,20,20,25,50,2,17,3,20,20,20,5,1,18,15,2,3,25,12,9,3,3,19,16,20,
5,5,1,4,15,16,5,20,16,2,25,6,12,25,11,25,7,2,5,19,17,17,2,12)

####################
# Simple model
####################

## Step 1: EM algorithm

# Get my variance in the simple Gaussian model
a = simpleEM(x,niter=100)

# Check the log likelihood
plot(1:a$niter,a$loglik,type="l",xlab="Iteration",ylab="Log likelihood") 

# The EM estimate of my variance
s = a$s.final

## Step 2: Generate a heatmap

# Build the matrix of expected scores
e = simpleExpScores(s)

# Plot it
par(mfrow=c(1,2))
drawHeatmap(e)
drawBoard(new=TRUE)
drawAimSpot(e)

####################
# General model
####################

## Step 1: EM algorithm

# Get my variance in the general Gaussian model
aa = generalEM(x,niter=100,seed=0)

# The EM estimate of my covariance matrix
Sig = aa$Sig.final

## Step 2: Generate a heatmap

# Build the matrix of expected scores
ee = generalExpScores(Sig)

# Plot it
par(mfrow=c(1,2))
drawHeatmap(ee)
drawBoard(new=TRUE)
drawAimSpot(ee)



