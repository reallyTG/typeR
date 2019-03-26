library(ade4)


### Name: amova
### Title: Analysis of molecular variance
### Aliases: amova print.amova
### Keywords: multivariate

### ** Examples

data(humDNAm)
amovahum <- amova(humDNAm$samples, sqrt(humDNAm$distances), humDNAm$structures)
amovahum



