library(aSPU)


### Name: GATES2
### Title: Gene-based Association Test that uses an extended Simes
###   procedure (GATES) for single trait - SNP set association
### Aliases: GATES2

### ** Examples


simula <- simPathAR1Snp(nGenes=20, nGenes1=1, nSNPlim=c(1, 20), nSNP0=1:3,
                           LOR=.2, rholim=c(0,0),
                           n=100, MAFlim=c(0.05, 0.4), p0=0.05)
Ps <- getlogitp(simula$Y, simula$X)

## get correlation of SNPs using controls
ldmat <- cor(simula$X[ simula$Y == 0, ])

o.pvec = order(Ps)
 ldmat <- ldmat[o.pvec, o.pvec]
(gatesp <- GATES2(ldmat, sort(Ps))[1])





