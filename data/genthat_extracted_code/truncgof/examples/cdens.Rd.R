library(truncgof)


### Name: cdens
### Title: Build a conditional density function
### Aliases: cdens
### Keywords: distribution

### ** Examples

require(MASS)
set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)   # complete sample
xt <- xc[xc >= treshold]   # left truncated sample

clnorm <- cdens("plnorm", H = treshold)
args(clnorm)

# mle fitting based on the complete sample
start <- list(meanlog = 2, sdlog = 1)
fitdistr(xc, dlnorm, start = start)

# mle fitting based on the truncated sample
fitdistr(xt, clnorm, start = start)

# in contrast
fitdistr(xt, dlnorm, start = start)



