library(fdANOVA)


### Name: plot.fmanovatrp
### Title: Plot P-values of Tests Based on Random Projections for FMANOVA
###   Problem
### Aliases: plot.fmanovatrp
### Keywords: Plot

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
fmanova2 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20),
                        permutation = TRUE, B = 1000, parallel = TRUE, nslaves = 2)
plot(x = fmanova1)
plot(x = fmanova1, withoutRoy = TRUE)
plot(y = fmanova2)
plot(x = fmanova1, y = fmanova2)
plot(x = fmanova1, y = fmanova2, withoutRoy = TRUE)

# the tests based on random projections with the Brownian motion generated for projections
set.seed(123)
fmanova3 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20), projection = "BM")
fmanova4 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20), projection = "BM",
                        permutation = TRUE, B = 1000, parallel = TRUE, nslaves = 2)
plot(x = fmanova3)
plot(x = fmanova3, withoutRoy = TRUE)
plot(y = fmanova4)
plot(x = fmanova3, y = fmanova4)
plot(x = fmanova3, y = fmanova4, withoutRoy = TRUE)
## End(No test)
## Don't show: 
# the tests based on random projections with the Gaussian white noise generated for projections
fmanova1 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 3))
fmanova2 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 3),
                        permutation = TRUE, B = 5)
plot(x = fmanova1)
plot(y = fmanova2)
plot(x = fmanova1, y = fmanova2)
plot(x = fmanova1, y = fmanova2, withoutRoy = TRUE)

# the tests based on random projections with the Brownian motion generated for projections
fmanova3 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 3), projection = "BM")
fmanova4 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 3), projection = "BM",
                        permutation = TRUE, B = 5)
plot(x = fmanova3)
plot(y = fmanova4)
plot(x = fmanova3, y = fmanova4)
plot(x = fmanova3, y = fmanova4, withoutRoy = TRUE)
## End(Don't show)



