library(TFisher)


### Name: stat.tfisher.omni
### Title: Construct omnibus thresholding Fisher's (TFisher) p-value
###   combination statistic.
### Aliases: stat.tfisher.omni

### ** Examples

pval = runif(20)
TAU1 = c(0.01, 0.05, 0.5, 1)
TAU2 = c(0.1, 0.2, 0.5, 1)
stat.tfisher.omni(p=pval, TAU1=TAU1, TAU2=TAU2)
M = matrix(0.3,20,20) + diag(1-0.3,20)
stat.tfisher.omni(p=pval, TAU1=TAU1, TAU2=TAU2, M=M)



