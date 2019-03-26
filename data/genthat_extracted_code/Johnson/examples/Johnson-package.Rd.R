library(Johnson)


### Name: Johnson-package
### Title: Johnson transformation
### Aliases: Johnson-package Johnson
### Keywords: package

### ** Examples

# transforming to normality a random sample with beta distribution
x <- rbeta(30,2,3)
y <- RE.Johnson(x); print(y)

# working with the transformed variable
x <- runif(100)
y <- RE.Johnson(x) $ transformed; print(y)

# working with the p-values
x <- rgamma(100,2,1)
y <- RE.Johnson(x)$p; print(y)



