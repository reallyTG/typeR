library(cthreshER)


### Name: cterSimData
### Title: Simulated data from the continuous threshold expectile
###   regression
### Aliases: cterSimData
### Keywords: cterSimData

### ** Examples


## simulated data
ptm <- proc.time()
n <- 200
t0 <- 1.5
bet0 <- c(1, 3, -2, 1)
tau <- 0.5
modtype <- 1
errtype <- 1
dat <- cterSimData(n, bet0, t0, tau, modtype, errtype)
head(dat)
proc.time() - ptm



