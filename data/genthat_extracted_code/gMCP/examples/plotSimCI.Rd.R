library(gMCP)


### Name: plotSimCI
### Title: Plot confidence intervals
### Aliases: plotSimCI
### Keywords: hplot

### ** Examples



est <- c("H1"=0.860382, "H2"=0.9161474, "H3"=0.9732953)
# Sample standard deviations:
ssd <- c("H1"=0.8759528, "H2"=1.291310, "H3"=0.8570892)

pval <- c(0.01260, 0.05154, 0.02124)/2

ci <- simConfint(BonferroniHolm(3), pvalues=pval, 
  	confint="t", df=9, estimates=est, alpha=0.025, alternative="greater")

plotSimCI(ci)





