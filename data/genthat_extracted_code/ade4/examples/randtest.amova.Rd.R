library(ade4)


### Name: randtest.amova
### Title: Permutation tests on an analysis of molecular variance (in C).
### Aliases: randtest.amova
### Keywords: multivariate nonparametric

### ** Examples

data(humDNAm)
amovahum <- amova(humDNAm$samples, sqrt(humDNAm$distances), humDNAm$structures)
amovahum
randtesthum <- randtest(amovahum, 49)
plot(randtesthum)



