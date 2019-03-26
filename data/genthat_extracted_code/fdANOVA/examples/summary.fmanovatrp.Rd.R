library(fdANOVA)


### Name: summary.fmanovatrp
### Title: Print "fmanovatrp" object
### Aliases: summary.fmanovatrp
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

# the tests based on random projections with the Gaussian white noise generated for projections
set.seed(123)
fmanova1 <- fmanova.trp(x.gait, group.label.gait, k = c(1, 5, 10, 15, 20))
summary(fmanova1)



