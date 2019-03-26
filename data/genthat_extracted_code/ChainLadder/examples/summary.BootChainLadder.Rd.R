library(ChainLadder)


### Name: summary.BootChainLadder
### Title: Methods for BootChainLadder objects
### Aliases: summary.BootChainLadder print.BootChainLadder
###   quantile.BootChainLadder mean.BootChainLadder
###   residuals.BootChainLadder
### Keywords: methods print

### ** Examples

B <- BootChainLadder(RAA, R=999, process.distr="gamma")
B
summary(B)
mean(B)
quantile(B, c(0.75,0.95,0.99, 0.995))




