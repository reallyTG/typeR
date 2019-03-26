library(gMCP)


### Name: simConfint
### Title: Simultaneous confidence intervals for sequentially rejective
###   multiple test procedures
### Aliases: simConfint simConfint,graphMCP-method
### Keywords: htest graphs

### ** Examples


est <- c("H1"=0.860382, "H2"=0.9161474, "H3"=0.9732953)
# Sample standard deviations:
ssd <- c("H1"=0.8759528, "H2"=1.291310, "H3"=0.8570892)

pval <- c(0.01260, 0.05154, 0.02124)/2

simConfint(BonferroniHolm(3), pvalues=pval, 
		confint=function(node, alpha) {
			c(est[node]-qt(1-alpha,df=9)*ssd[node]/sqrt(10), Inf)
		}, estimates=est, alpha=0.025, mu=0, alternative="greater")

# Note that the sample standard deviations in the following call
# will be calculated from the pvalues and estimates.
ci <- simConfint(BonferroniHolm(3), pvalues=pval, 
		confint="t", df=9, estimates=est, alpha=0.025, alternative="greater")
ci
	
plotSimCI(ci)




