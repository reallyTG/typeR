library(fdANOVA)


### Name: summary.fmanovaptbfr
### Title: Print "fmanovaptbfr" object
### Aliases: summary.fmanovaptbfr
### Keywords: Printing

### ** Examples

# gait data (both features)
library(fda)
gait.data.frame <- as.data.frame(gait)
x.gait <- vector("list", 2)
x.gait[[1]] <- as.matrix(gait.data.frame[, 1:39])
x.gait[[2]] <- as.matrix(gait.data.frame[, 40:78])

# vector of group labels
group.label.gait <- rep(1:3, each = 13)

# the tests based on a basis function representation with default parameters
set.seed(123)
fmanova1 <- fmanova.ptbfr(x.gait, group.label.gait)
summary(fmanova1)



