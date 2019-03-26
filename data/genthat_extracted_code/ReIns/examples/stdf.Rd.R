library(ReIns)


### Name: stdf
### Title: Non-parametric estimators of the STDF
### Aliases: stdf stdf2

### ** Examples

# Generate data matrix
X <- cbind(rpareto(100,2), rpareto(100,3))

# Tail index
k <- 20

# Point to evaluate the STDF in
x <- c(2,3)

# First estimate
stdf(x, k, X)

# Second estimate
stdf2(x, k, X)



