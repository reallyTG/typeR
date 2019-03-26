library(adaptMCMC)


### Name: MCMC.parallel
### Title: Parallel computation of MCMC()
### Aliases: MCMC.parallel

### ** Examples


## ----------------------
## Banana shaped distribution

## log-pdf to sample from
p.log <- function(x) {
  B <- 0.03                              # controls 'bananacity'
  -x[1]^2/200 - 1/2*(x[2]+B*x[1]^2-100*B)^2
}

## ----------------------
## generate samples
## compute 4 independent chains on 2 CPU's (if available) in parallel

samp <- MCMC.parallel(p.log, n=200, init=c(x1=0, x2=1),
    n.chain=4, n.cpu=2, scale=c(1, 0.1),
    adapt=TRUE, acc.rate=0.234)

str(samp)




