library(lsbclust)


### Name: rlsbclust
### Title: Simulate from LSBCLUST Model
### Aliases: rlsbclust

### ** Examples

## Nothing fixed, balanced classes
set.seed(1)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(10, 8), nclust = c(5, 4, 6, 5))
res <- lsbclust(data = dat[[1]]$data, nclust = c(5, 4, 6, 5))
cfsim(res, dat[[1]])

## Rows fixed, balanced classes
set.seed(2)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(10, 8), nclust = c(5, 4, 6, 5), 
                 fixed = "rows")
res <- lsbclust(data = dat[[1]]$data, nclust = c(5, 4, 6, 5), fixed = "rows")
cfsim(res, dat[[1]])

## Rows fixed, unbalanced classes
set.seed(3)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(10, 8), nclust = c(5, 4, 6, 5), 
                 fixed = "columns", 
                 clustsize = list(NULL, NULL, c(40, 25, 15, 10, 5, 5), c(40, 25, 15, 10, 10)))
res <- lsbclust(data = dat[[1]]$data, nclust = c(5, 4, 6, 5), fixed = "columns")
cfsim(res, dat[[1]])



