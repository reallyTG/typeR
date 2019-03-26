library(adaptMCMC)


### Name: convert.to.coda
### Title: Converts chain(s) into 'coda' objects.
### Aliases: convert.to.coda

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
               adapt=TRUE, acc.rate=0.234)


## ----------------------
## convert in object of class 'mcmc'
samp.coda <- convert.to.coda(samp)

class(samp.coda)

## ----------------------
## use functions of package 'coda'

require(coda)

plot(samp.coda)
cumuplot(samp.coda)



