library(ade4)


### Name: lingoes
### Title: Transformation of a Distance Matrix for becoming Euclidean
### Aliases: lingoes
### Keywords: array multivariate

### ** Examples

data(capitales)
d0 <- capitales$dist
is.euclid(d0) # FALSE
d1 <- lingoes(d0, TRUE)
# Lingoes constant = 2120982
is.euclid(d1) # TRUE
plot(d0, d1)
x0 <- sort(unclass(d0))
lines(x0, sqrt(x0^2 + 2 * 2120982), lwd = 3)
 
is.euclid(sqrt(d0^2 + 2 * 2120981), tol = 1e-10) # FALSE
is.euclid(sqrt(d0^2 + 2 * 2120982), tol = 1e-10) # FALSE
is.euclid(sqrt(d0^2 + 2 * 2120983), tol = 1e-10) 
    # TRUE the smaller constant



