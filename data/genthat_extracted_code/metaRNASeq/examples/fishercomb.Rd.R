library(metaRNASeq)


### Name: fishercomb
### Title: P-value combination using Fisher's method
### Aliases: fishercomb
### Keywords: methods models

### ** Examples

data(rawpval)
fishcomb <- fishercomb(rawpval, BHth = 0.05)
DE <- ifelse(fishcomb$adjpval<=0.05,1,0)
hist(fishcomb$rawpval,nclass=100)

## A more detailed example is given in the vignette of the package:
## vignette("metaRNASeq")



