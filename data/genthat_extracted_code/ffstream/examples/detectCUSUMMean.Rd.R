library(ffstream)


### Name: detectCUSUMMean
### Title: Detect a change/changes in a vector using CUSUM method
### Aliases: detectCUSUMMean

### ** Examples

# create a stream with three changepoints
set.seed(8)
x <- rnorm(400, 5, 1) + rep(c(0:3), each=100) # mean is 5 and s.d. is 1

# multiple changepoints
list_cusum <- detectCUSUMMean(x, k=0.25, h=8.00, BL=50, multiple=TRUE)

# now only a single (the first) changepoint
list_cusum2 <- detectCUSUMMean(x, k=0.25, h=8.00, BL=50, single=TRUE)

# now only a single (the first) changepoint, but with the prechange 
# mean and variance known
list_cusum3 <- detectCUSUMMean(x, k=0.25, h=8.00, BL=50, single=TRUE,
                               prechangeMean=5, prechangeSigma=1)







