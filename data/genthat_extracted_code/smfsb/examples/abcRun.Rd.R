library(smfsb)


### Name: abcRun
### Title: Run a set of simulations initialised with parameters sampled
###   from a given prior distribution, and compute statistics required for
###   an ABC analaysis
### Aliases: abcRun
### Keywords: smfsb

### ** Examples

## No test: 
data(LVdata)
rprior <- function() { exp(c(runif(1, -3, 3),runif(1,-8,-2),runif(1,-4,2))) }
rmodel <- function(th) { simTs(c(50,100), 0, 30, 2, stepLVc, th) }
sumStats <- identity
ssd = sumStats(LVperfect)
distance <- function(s) {
    diff = s - ssd
    sqrt(sum(diff*diff))
}
rdist <- function(th) { distance(sumStats(rmodel(th))) }
out = abcRun(10000, rprior, rdist)
q=quantile(out$dist, c(0.01, 0.05, 0.1))
print(q)
accepted = out$param[out$dist < q[1],]
print(summary(accepted))
print(summary(log(accepted)))
## End(No test)



