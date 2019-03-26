library(metaRNASeq)


### Name: invnorm
### Title: P-value combination using the inverse normal method
### Aliases: invnorm
### Keywords: methods models

### ** Examples

data(rawpval)
## 8 replicates simulated in each study
invnormcomb <- invnorm(rawpval,nrep=c(8,8), BHth = 0.05)       
DE <- ifelse(invnormcomb$adjpval<=0.05,1,0)
hist(invnormcomb$rawpval,nclass=100)

## A more detailed example is given in the vignette of the package:
## vignette("metaRNASeq")



