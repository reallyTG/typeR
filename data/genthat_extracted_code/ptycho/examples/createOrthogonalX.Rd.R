library(ptycho)


### Name: createOrthogonalX
### Title: Create Design Matrix With Orthogonal Columns
### Aliases: createOrthogonalX

### ** Examples

n <- 50; p <- 5
X <- createOrthogonalX(n, p)
XtX <- t(X) %*% X
D <- diag(n-1, nrow=p)
# XtX and D are not quite equal due to roundoff error
range(XtX - D)



