library(TFisher)


### Name: p.tfisher
### Title: CDF of thresholding Fisher's p-value combination statistic under
###   the null hypothesis.
### Aliases: p.tfisher

### ** Examples

pval <- runif(20)
tfstat <- stat.tfisher(p=pval, tau1=0.25, tau2=0.75)
p.tfisher(q=tfstat, n=20, tau1=0.25, tau2=0.75)
M = matrix(0.3,20,20) + diag(1-0.3,20)
p.tfisher(q=tfstat, n=20, tau1=0.25, tau2=0.75, M=M)



