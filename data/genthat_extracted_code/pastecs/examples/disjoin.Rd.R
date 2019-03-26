library(pastecs)


### Name: disjoin
### Title: Complete disjoined coded data (binary coding)
### Aliases: disjoin
### Keywords: manip

### ** Examples

# Artificial data with 1/5 of zeros
Z <- c(abs(rnorm(8000)), rep(0, 2000))
# Let the program chose cuts
table(cut(Z, breaks=5))
# Create one class for zeros, and 4 classes for the other observations
Z2 <- Z[Z != 0]
cuts <- c(-1e-10, 1e-10, quantile(Z2, 1:5/5, na.rm=TRUE))
cuts
table(cut(Z, breaks=cuts))
# Binary coding of these data
disjoin(cut(Z, breaks=cuts))[1:10, ]



