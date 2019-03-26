library(fdANOVA)


### Name: fmanova.trp
### Title: Tests Based on Random Projections for FMANOVA Problem
### Aliases: fmanova.trp
### Keywords: Multivariate Test

### ** Examples

# Some of the examples may run some time.

# gait data (both features)
library(fda)
gait.data.frame <- as.data.frame(gait)
x.gait <- vector("list", 2)
x.gait[[1]] <- as.matrix(gait.data.frame[, 1:39])
x.gait[[2]] <- as.matrix(gait.data.frame[, 40:78])

# vector of group labels
group.label.gait <- rep(1:3, each = 13)
## No test: 
# the tests based on random projections with the Gaussian white noise generated for projections
set.seed(123)
fmanova1 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20))
summary(fmanova1)
fmanova2 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20),
                        permutation = TRUE, B = 1000,
                        parallel = TRUE, nslaves = 2)
summary(fmanova2)

# the tests based on random projections with the Brownian motion generated for projections
set.seed(123)
fmanova3 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20), projection = "BM")
summary(fmanova3)
fmanova4 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20), projection = "BM",
                        permutation = TRUE, B = 1000,
                        parallel = TRUE, nslaves = 2)
summary(fmanova4)
## End(No test)
## Don't show: 
# the tests based on random projections with the Gaussian white noise generated for projections
fmanova1 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 3))

# the tests based on random projections with the Brownian motion generated for projections
fmanova3 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 3), projection = "BM")
## End(Don't show)



