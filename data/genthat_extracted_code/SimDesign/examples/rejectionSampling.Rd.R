library(SimDesign)


### Name: rejectionSampling
### Title: Rejection sampling (i.e., accept-reject method) to draw samples
###   from difficult probability density functions
### Aliases: rejectionSampling

### ** Examples


# Generate X ~ beta(a,b), where a and b are a = 2.7 and b = 6.3,
# and the support is Y ~ Unif(0,1)
df <- function(x) dbeta(x, shape1 = 2.7, shape2 = 6.3)
dg <- function(x) dunif(x, min = 0, max = 1)
rg <- function(n) runif(n, min = 0, max = 1)

dat <- rejectionSampling(10000, df=df, dg=dg, rg=rg)
hist(dat, 100)
hist(rbeta(10000, 2.7, 6.3), 100) # compare

# when df and dg both integrate to 1, acceptance probability = 1/M
rejectionSampling(df=df, dg=dg, rg=rg, returnM=TRUE)

# user supplied M. Here, M = 4, indicating 25% acceptance rate
dat2 <- rejectionSampling(10000, df=df, dg=dg, rg=rg, M=4)
hist(dat2, 100)

# generate using better support function (here, Y ~ beta(2,6))
dg <- function(x) dbeta(x, shape1 = 2, shape2 = 6)
rg <- function(n) rbeta(n, shape1 = 2, shape2 = 6)
rejectionSampling(10000, df=df, dg=dg, rg=rg, returnM=TRUE) # more efficient
dat <- rejectionSampling(10000, df=df, dg=dg, rg=rg)
hist(dat, 100)

#------------------------------------------------------
# sample from wonky (and non-normed) pdf, like below
df <- function(x){
    ret <- numeric(length(x))
    ret[x <= .5] <- dnorm(x[x <= .5])
    ret[x > .5] <-  dnorm(x[x > .5]) + dchisq(x[x > .5], df = 2)
    ret
}
y <- seq(-5,5, length.out = 1000)
plot(y, df(y), type = 'l', main = "pdf to sample")

# choose dg/rg functions that have support within the range [-inf, inf]
rg <- function(n) rnorm(n, sd=2)
dg <- function(x) dnorm(x, sd=2)
dat <- rejectionSampling(10000, df=df, dg=dg, rg=rg)
hist(dat, 100, prob=TRUE)
lines(density(dat), col = 'red')

# same as above, but df not vectorized (much slower)
df2 <- function(x){
    ret <- if(x <= .5) dnorm(x)
    else if(x > .5) dnorm(x) + dchisq(x, df = 2)
    ret
}
system.time(dat2 <-
   rejectionSampling(100000, df=df2, dg=dg, rg=rg, vectorized=FALSE))
system.time(dat <-
   rejectionSampling(100000, df=df, dg=dg, rg=rg))

#-----------------------------------------------------
# multivariate distribution
df <- function(x) prod(c(dnorm(x[1]) + dchisq(x[1], df = 5),
                   dnorm(x[2], -1, 2)))
rg <- function(n) c(rnorm(n, sd=3), rnorm(n, sd=3))
dg <- function(x) prod(c(dnorm(x[1], sd=3), dnorm(x[1], sd=3)))

dat <- rejectionSampling(5000, df=df, dg=dg, rg=rg, M=10)
hist(dat[,1], 30)
hist(dat[,2], 30)
plot(dat)




