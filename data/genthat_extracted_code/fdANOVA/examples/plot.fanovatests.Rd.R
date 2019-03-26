library(fdANOVA)


### Name: plot.fanovatests
### Title: Plot P-values of Tests Based on Random Projections for FANOVA
###   Problem
### Aliases: plot.fanovatests
### Keywords: Plot

### ** Examples

# Some of the examples may run some time.

# gait data (the first feature)
library(fda)
gait.data.frame <- as.data.frame(gait)
x.gait <- as.matrix(gait.data.frame[, 1:39])

# vector of group labels
group.label.gait <- rep(1:3, each = 13)
## No test: 
set.seed(123)
fanova4 <- fanova.tests(x.gait, group.label.gait, test = "TRP",
                        parallel = TRUE, nslaves = 2,
                        params = list(paramTRP = list(k = c(10, 20, 30), B.TRP = 1000)))
set.seed(123)
fanova5 <- fanova.tests(x.gait, group.label.gait, test = "TRP",
                        parallel = TRUE, nslaves = 2,
                        params = list(paramTRP = list(k = c(10, 20, 30),
                                                      permutation = TRUE, B.TRP = 1000)))
plot(x = fanova4)
plot(y = fanova5)
plot(x = fanova4, y = fanova5)

set.seed(123)
fanova6 <- fanova.tests(x.gait, group.label.gait, test = "TRP",
                        parallel = TRUE, nslaves = 2,
                        params = list(paramTRP = list(k = c(10, 20, 30), projection = "BM",
                                                      B.TRP = 1000)))
set.seed(123)
fanova7 <- fanova.tests(x.gait, group.label.gait, test = "TRP",
                        parallel = TRUE, nslaves = 2,
                        params = list(paramTRP = list(k = c(10, 20, 30), projection = "BM",
                                                      permutation = TRUE, B.TRP = 1000)))
plot(x = fanova6)
plot(y = fanova7)
plot(x = fanova6, y = fanova7)
## End(No test)
## Don't show: 
fanova4 <- fanova.tests(x.gait, group.label.gait, test = "TRP",
                        params = list(paramTRP = list(k = c(1, 3), B.TRP = 3)))
fanova5 <- fanova.tests(x.gait, group.label.gait, test = "TRP",
                        params = list(paramTRP = list(k = c(1, 3),
                                                      permutation = TRUE, B.TRP = 3)))
plot(x = fanova4)
plot(y = fanova5)
plot(x = fanova4, y = fanova5)
## End(Don't show)



