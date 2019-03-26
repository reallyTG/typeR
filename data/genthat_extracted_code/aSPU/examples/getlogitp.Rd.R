library(aSPU)


### Name: getlogitp
### Title: Get the p-values of the multiple SNPs based on the Wald test in
###   a logistic regresion model.
### Aliases: getlogitp

### ** Examples


simula <- simPathAR1Snp(nGenes=20, nGenes1=1, nSNPlim=c(1, 20), nSNP0=1:3,
                           LOR=.2, rholim=c(0,0),
                           n=100, MAFlim=c(0.05, 0.4), p0=0.05)
logitp <- getlogitp(simula$Y, simula$X)





