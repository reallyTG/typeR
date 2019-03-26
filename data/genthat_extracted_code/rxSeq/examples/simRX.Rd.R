library(rxSeq)


### Name: simRX
### Title: Produce simulated counts
### Aliases: simRX
### Keywords: utilities

### ** Examples

# simulating autosomal data:
dat.A = simRX(b0f=.5, b0m=.6, b1f=.3, b1m=.4, beta_sex=.1, beta_dom=.1, n.simu=1E1)
names(dat.A)
# simulating autosomal data:
dat.X = simRX(b0f=.5, b0m=.6, b1f=.3, b1m=.4, beta_sex=.1, beta_dom=.1, n.simu=1E1, 
              is.X=TRUE, tauB=.3)
names(dat.X)



