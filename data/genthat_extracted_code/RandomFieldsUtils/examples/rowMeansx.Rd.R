library(RandomFieldsUtils)


### Name: rowMeansx
### Title: Some Further Row and Column Functions
### Aliases: rowMeans rowMeansx colMax rowProd SelfDivByRow quadratic dotXV
### Keywords: utilities

### ** Examples


c <- if (interactive()) 10000 else 10
r <- if (interactive()) 20000 else 20
M <- matrix(nc = r, nr=r, 1:(c * r))

## unweighted means, compare to rowMeans
print(system.time(m1 <- rowMeans(M)))
print(system.time(m2 <- rowMeansx(M)))
stopifnot(all.equal(m1, m2))

## weighted row means, compare to rowMeans
W <- 1 / (ncol(M) : 1)
print(system.time({M0 <- t(W * t(M)); m1 <- rowMeans(M0)}))
print(system.time(m2 <- rowMeansx(M, W)))
stopifnot(all.equal(m1, m2))

print(system.time(m1 <- apply(M, 2, max)))
print(system.time(m2 <- colMax(M)))
stopifnot(m1 == m2)




