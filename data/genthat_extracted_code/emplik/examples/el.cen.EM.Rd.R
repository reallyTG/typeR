library(emplik)


### Name: el.cen.EM
### Title: Empirical likelihood ratio for mean with right, left or doubly
###   censored data, by EM algorithm
### Aliases: el.cen.EM
### Keywords: nonparametric survival htest

### ** Examples

## example with tied observations
x <- c(1, 1.5, 2, 3, 4, 5, 6, 5, 4, 1, 2, 4.5)
d <- c(1,   1, 0, 1, 0, 1, 1, 1, 1, 0, 0,   1)
el.cen.EM(x,d,mu=3.5)
## we should get "-2LLR" = 1.2466....
myfun5 <- function(x, theta, eps) {
u <- (x-theta)*sqrt(5)/eps 
INDE <- (u < sqrt(5)) & (u > -sqrt(5)) 
u[u >= sqrt(5)] <- 0 
u[u <= -sqrt(5)] <- 1 
y <- 0.5 - (u - (u)^3/15)*3/(4*sqrt(5)) 
u[ INDE ] <- y[ INDE ] 
return(u)
}
el.cen.EM(x, d, fun=myfun5, mu=0.5, theta=3.5, eps=0.1)
## example of using wt in the input. Since the x-vector contain
## two 5 (both d=1), and two 2(both d=0), we can also do
xx <- c(1, 1.5, 2, 3, 4, 5, 6, 4, 1, 4.5)
dd <- c(1,   1, 0, 1, 0, 1, 1, 1, 0,   1)
wt <- c(1,   1, 2, 1, 1, 2, 1, 1, 1,   1)
el.cen.EM(x=xx, d=dd, wt=wt, mu=3.5)
## this should be the same as the first example.



