library(rvalues)


### Name: mroot
### Title: Multi-dimensional Root (Zero) Finding
### Aliases: mroot
### Keywords: optimize

### ** Examples

ff <- function(x,a) {
    ans <- qnorm(x) - a
    return(ans)
}
n <- 10000
a <- rnorm(n)
low <- rep(0,n)
up <- rep(1,n)

## Find the roots of ff, first using mroot and
## then by using uniroot inside a loop.

system.time(mr <- mroot(ff, lower = low, upper = up, a = a))

ur <- rep(0,n)
system.time({
for(i in 1:n) {
   ur[i] <- uniroot(ff, lower = 0, upper = 1, a = a[i])$root    
}
})




