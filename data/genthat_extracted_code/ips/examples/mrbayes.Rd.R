library(ips)


### Name: mrbayes
### Title: Bayesian MCMC Tree Search with MrBayes
### Aliases: mrbayes mrbayes.mixed

### ** Examples
	
# DNA sequence data:
# ------------------
data(ips.cox1)
x <- ips.cox1[, 100:140] # tiny alignment

# print NEXUS file with MrBayes block to working directory
# --------------------------------------------------------
mrbayes(x, file = "", ngen = 100, run = FALSE)
    



