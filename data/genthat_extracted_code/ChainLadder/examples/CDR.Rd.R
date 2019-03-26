library(ChainLadder)


### Name: CDR
### Title: One year claims development result
### Aliases: CDR CDR.MackChainLadder CDR.BootChainLadder CDR.default
### Keywords: models

### ** Examples

# Example from the 2008 Merz, Wuthrich paper mentioned above
MW2008
M <- MackChainLadder(MW2008, est.sigma="Mack")
plot(M)
CDR(M)
# Return all run-off result developments
CDR(M, dev="all")

# Example from the 2014 Merz, Wuthrich paper mentioned above
MW2014
W <- MackChainLadder(MW2014, est.sigma="Mack")
plot(W)
CDR(W)

# Example with the BootChainLadder function, assuming overdispered Poisson model
B <- BootChainLadder(MW2008, process.distr=c("od.pois"))
B
CDR(B)



