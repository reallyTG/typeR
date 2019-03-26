library(Johnson)


### Name: RE.ADT
### Title: Anderson-Darling test
### Aliases: RE.ADT
### Keywords: ~kwd1 ~kwd2

### ** Examples

# performing the AD test for a random sample
x <- rnorm(100,10,2)
y <- RE.ADT(x); print(y)

#working with the p-value
x <- runif(100)
y <- RE.ADT(x) $p; print(y)




