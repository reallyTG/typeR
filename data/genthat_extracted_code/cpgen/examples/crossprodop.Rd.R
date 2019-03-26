library(cpgen)


### Name: %c%
### Title: (Parallel) Matrix product operator
### Aliases: %c%
### Keywords: Tools

### ** Examples


# Least Squares Solving

# Generate random data 

n = 1000
p = 500

M <- matrix(rnorm(n*p),n,p)
y <- rnorm(n)

# least squares solution:

b <- csolve(t(M) %c% M, t(M) %c% y)




