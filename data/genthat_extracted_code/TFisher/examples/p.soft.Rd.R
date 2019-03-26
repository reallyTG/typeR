library(TFisher)


### Name: p.soft
### Title: CDF of soft-thresholding Fisher's p-value combination statistic
###   under the null hypothesis.
### Aliases: p.soft

### ** Examples

pval <- runif(100)
softstat <- stat.soft(p=pval, tau1=0.05)
p.soft(q=softstat, n=100, tau1=0.05)
M = matrix(0.3,100,100) + diag(1-0.3,100)
p.soft(q=softstat, n=100, tau1=0.05, M=M)



