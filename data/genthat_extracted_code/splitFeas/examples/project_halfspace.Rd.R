library(splitFeas)


### Name: project_halfspace
### Title: Projection onto a halfspace
### Aliases: project_halfspace

### ** Examples

set.seed(12345)
p <- 3
a <- matrix(rnorm(p),p,1)
a <- a/norm(a,'f')
b <- runif(1)
x <- matrix(rnorm(p),p,1)
y <- project_halfspace(x,a,b)



