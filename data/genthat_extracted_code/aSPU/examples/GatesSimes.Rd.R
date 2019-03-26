library(aSPU)


### Name: GatesSimes
### Title: GATES-Simes test for single trait - pathway association.
### Aliases: GatesSimes

### ** Examples


simula <- simPathAR1Snp(nGenes=20, nGenes1=1, nSNPlim=c(1, 20), nSNP0=1:3,
                           LOR=.2, rholim=c(0,0),
                           n=100, MAFlim=c(0.05, 0.4), p0=0.05)
logitp <- getlogitp(simula$Y, simula$X)

## get correlation of SNPs using controls
ldmat <- cor(simula$X[ simula$Y == 0, ])
out <- GatesSimes(pvec = logitp, ldmatrix = ldmat, snp.info = simula$snp.info,
                  gene.info = simula$gene.info)
out





