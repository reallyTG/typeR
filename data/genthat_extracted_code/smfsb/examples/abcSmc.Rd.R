library(smfsb)


### Name: abcSmc
### Title: Run an ABC-SMC algorithm for infering the parameters of a
###   forward model
### Aliases: abcSmc
### Keywords: smfsb

### ** Examples

## No test: 
data(LVdata)
rprior <- function() { c(runif(1, -3, 3), runif(1, -8, -2), runif(1, -4, 2)) }
dprior <- function(x, ...) { dunif(x[1], -3, 3, ...) + 
                dunif(x[2], -8, -2, ...) + dunif(x[3], -4, 2, ...) }
rmodel <- function(th) { simTs(c(50,100), 0, 30, 2, stepLVc, exp(th)) }
rperturb <- function(th){th + rnorm(3, 0, 0.5)}
dperturb <- function(thNew, thOld, ...){sum(dnorm(thNew, thOld, 0.5, ...))}
sumStats <- identity
ssd = sumStats(LVperfect)
distance <- function(s) {
    diff = s - ssd
    sqrt(sum(diff*diff))
}
rdist <- function(th) { distance(sumStats(rmodel(th))) }
out = abcSmc(5000, rprior, dprior, rdist, rperturb,
             dperturb, verb=TRUE, steps=6, factor=5)
print(summary(out))
## End(No test)



