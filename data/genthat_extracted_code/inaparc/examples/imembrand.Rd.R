library(inaparc)


### Name: imembrand
### Title: Initialization of membership matrix using simple random sampling
### Aliases: imembrand
### Keywords: cluster

### ** Examples

data(iris)
n <- dim(iris)[1]

# Generate a fuzzy membership degrees matrix using default values
u <- imembrand(n=n, k=5)$u
head(u)
tail(u)

# Generate a fuzzy membership degrees matrix using the method 3
u <- imembrand(n=n, k=5, mtype="f3", numseed=123)$u
head(u)
tail(u)

# Generate a crisp membership degrees matrix 
u <- imembrand(n=n, k=5, mtype="h")$u
head(u)
tail(u)



