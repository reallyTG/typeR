library(ffstream)


### Name: detectAFFMean
### Title: Detect a change/changes in a vector using AFF method
### Aliases: detectAFFMean

### ** Examples

# create a stream with three changepoints
set.seed(8)
x <- rnorm(400, 5, 1) + rep(c(0:3), each=100) # mean is 5 and s.d. is 1

# multiple changepoints
list_aff <- detectAFFMean(x, alpha=0.01, eta=0.01, BL=50, multiple=TRUE)

# now only a single (the first) changepoint
list_aff2 <- detectAFFMean(x, alpha=0.01, eta=0.01, BL=50, single=TRUE)

# now only a single (the first) changepoint, but with the prechange 
# mean and variance known
list_aff3 <- detectAFFMean(x, alpha=0.01, eta=0.01, single=TRUE, 
                           prechangeMean=5, prechangeSigma=1)






