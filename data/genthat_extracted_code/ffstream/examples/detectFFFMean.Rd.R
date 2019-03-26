library(ffstream)


### Name: detectFFFMean
### Title: Detect a change/changes in a vector using FFF method
### Aliases: detectFFFMean

### ** Examples

# create a stream with three changepoints
set.seed(8)
x <- rnorm(400, 5, 1) + rep(c(0:3), each=100) # mean is 5 and s.d. is 1

# multiple changepoints
list_fff <- detectFFFMean(x, alpha=0.01, lambda=0.95, BL=50, multiple=TRUE)

# now only a single (the first) changepoint
list_fff2 <- detectFFFMean(x, alpha=0.01, lambda=0.95, BL=50, single=TRUE)

# now only a single (the first) changepoint, but with the prechange 
# mean and variance known
list_fff3 <- detectFFFMean(x, alpha=0.01, lambda=0.95, BL=50, single=TRUE,
                          prechangeMean=5, prechangeSigma=1)





