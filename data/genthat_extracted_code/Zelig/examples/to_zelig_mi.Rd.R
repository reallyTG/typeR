library(Zelig)


### Name: to_zelig_mi
### Title: Bundle Multiply Imputed Data Sets into an Object for Zelig
### Aliases: to_zelig_mi

### ** Examples

# create datasets
n <- 100
x1 <- runif(n)
x2 <- runif(n)
y <- rnorm(n)
data.1 <- data.frame(y = y, x = x1)
data.2 <- data.frame(y = y, x = x2)

# merge datasets into one object as if imputed datasets

mi.out <- to_zelig_mi(data.1, data.2)

# pass object in place of data argument
z.out <- zelig(y ~ x, model = "ls", data = mi.out)



