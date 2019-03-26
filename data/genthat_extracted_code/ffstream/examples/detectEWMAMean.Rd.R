library(ffstream)


### Name: detectEWMAMean
### Title: Detect a change/changes in a vector using EWMA method
### Aliases: detectEWMAMean

### ** Examples

# create a stream with three changepoints
set.seed(8)
x <- rnorm(400, 5, 1) + rep(c(0:3), each=100) # mean is 5 and s.d. is 1

# multiple changepoints
list_ewma <- detectEWMAMean(x, r=0.25, L=3.023, BL=50, multiple=TRUE)

# now only a single (the first) changepoint
list_ewma2 <- detectEWMAMean(x, r=0.25, L=3.023, BL=50, single=TRUE)

# now only a single (the first) changepoint, but with the prechange 
# mean and variance known
list_ewma3 <- detectEWMAMean(x, r=0.25, L=3.023, BL=50, single=TRUE,
                             prechangeMean=5, prechangeSigma=1)





