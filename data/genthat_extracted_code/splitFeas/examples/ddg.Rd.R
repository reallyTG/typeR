library(splitFeas)


### Name: ddg
### Title: Compute the approximate Hessian of the majorization.
### Aliases: ddg

### ** Examples

set.seed(12345)
n <- 10
p <- 2
x <- matrix(rnorm(p),p,1)
v <- 1
w <- 1
A <- matrix(rnorm(n*p),n,p)
hgrad <- function(x) {return(t(A))}
sol <- ddg(x,v,w,hgrad)



