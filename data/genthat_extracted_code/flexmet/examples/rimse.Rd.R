library(flexmet)


### Name: rimse
### Title: Root Integrated Mean Squared Difference Between FMP IRFs
### Aliases: rimse

### ** Examples


set.seed(2342)
bmat <- sim_bmat(n_items = 1, k = 2)$bmat

theta <- rnorm(500)
dat <- sim_data(bmat = bmat, theta = theta)

# k = 0
fmp0 <- fmp_1(dat = dat, k = 0, tsur = theta)

# k = 1
fmp1 <- fmp_1(dat = dat, k = 1, tsur = theta)

## compare estimated curves to the data-generating curve
rimse(fmp0$bmat, bmat)
rimse(fmp1$bmat, bmat)





