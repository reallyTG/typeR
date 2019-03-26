library(lmomco)


### Name: parnor
### Title: Estimate the Parameters of the Normal Distribution
### Aliases: parnor
### Keywords: distribution (parameters) Distribution: Normal

### ** Examples

lmr <- lmoms(rnorm(20))
parnor(lmr)

# A more extended example to explore the differences between an
# L-moment derived estimate of the standard deviation and R's sd()
true.std <- 15000 # select a large standard deviation
std         <- vector(mode = "numeric") # vector of sd()
std.by.lmom <- vector(mode = "numeric") # vector of L-scale values
sam <- 7   # number of samples to simulate
sim <- 100 # perform simulation sim times
for(i in seq(1,sim)) {
  Q <- rnorm(sam,sd=15000) # draw random normal variates
  std[i] <- sd(Q) # compute standard deviation
  lmr <- lmoms(Q) # compute the L-moments
  std.by.lmom[i] <- lmr$lambdas[2] # save the L-scale value
}
# convert L-scale values to equivalent standard deviations
std.by.lmom      <- sqrt(pi)*std.by.lmom

# compute the two biases and then output
# see how the standard deviation estimated through L-scale
# has a smaller bias than the usual (product moment) standard
# deviation. The unbiasness of L-moments is demonstrated.
std.bias         <- true.std - mean(std)
std.by.lmom.bias <- true.std - mean(std.by.lmom)
cat(c(std.bias,std.by.lmom.bias,"\n"))



