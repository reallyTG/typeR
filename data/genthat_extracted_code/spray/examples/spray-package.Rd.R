library(spray)


### Name: spray-package
### Title: Sparse arrays and multivariate polynomials
### Aliases: spray-package
### Keywords: package

### ** Examples



# define a spray using a matrix of indices and a vector of values:
M <- matrix(sample(0:3,21,replace=TRUE),ncol=3)
a <- spray(M,sample(7))

# there are many pre-defined simple sprays:
b <- homog(3,4)

# arithmetic operators work:
a + 2*b
a - a*b^2/4
a+b

#  we can sum over particular dimensions:
asum(a+b,1)

# differentiation is supported:
deriv(a^6,2)

# extraction and replacement work as expected:

b[1,2,1]
b[1,2,1,drop=TRUE]

b[diag(3)] <- 3






