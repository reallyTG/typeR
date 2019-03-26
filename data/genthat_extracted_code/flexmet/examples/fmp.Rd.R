library(flexmet)


### Name: fmp
### Title: Estimate FMP Item Parameters
### Aliases: fmp fmp_1 fmp

### ** Examples


set.seed(2342)
bmat <- sim_bmat(n_items = 5, k = 2)$bmat

theta <- rnorm(50)
dat <- sim_data(bmat = bmat, theta = theta)

## fixed-effects estimation for item 1

tsur <- get_surrogates(dat)

# k = 0
fmp0_it_1 <- fmp_1(dat = dat[, 1], k = 0, tsur = tsur)

# k = 1
fmp1_it_1 <- fmp_1(dat = dat[, 1], k = 1, tsur = tsur)

# k = 2
fmp2_it_1 <- fmp_1(dat = dat[, 1], k = 2, tsur = tsur)


## fixed-effects estimation for all items

fmp0_fixed <- fmp(dat = dat, k = 0, em = FALSE)

## random-effects estimation for all items

fmp0_random <- fmp(dat = dat, k = 0, em = TRUE)




