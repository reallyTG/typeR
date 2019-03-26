library(adaptMCMC)


### Name: MCMC.add.samples
### Title: Add samples to an existing chain.
### Aliases: MCMC.add.samples

### ** Examples

## ----------------------
## Banana shaped distribution

## log-pdf to sample from
p.log <- function(x) {
  B <- 0.03                              # controls 'bananacity'
  -x[1]^2/200 - 1/2*(x[2]+B*x[1]^2-100*B)^2
}


## ----------------------
## generate 200  samples

samp <- MCMC(p.log, n=200, init=c(0, 1), scale=c(1, 0.1),
               adapt=TRUE, acc.rate=0.234, list=TRUE)


## ----------------------
## add 200 to the existing chain
samp <- MCMC.add.samples(samp, n.update=200)

str(samp)



