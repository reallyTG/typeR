library(aSPU)


### Name: simPathAR1Snp
### Title: Simulating a pathway with multiple SNPs.
### Aliases: simPathAR1Snp

### ** Examples


# Simulation set up A a) in the paper (Pan et al 2015)
## Not run: 
##D  simula <- simPathAR1Snp(nGenes=20, nGenes1=1, nSNPlim=c(1, 20), nSNP0=1:3,
##D                            LOR=.2, rholim=c(0,0),
##D                            n=100, MAFlim=c(0.05, 0.4), p0=0.05) 
## End(Not run)
## Don't show: 
 simula <- simPathAR1Snp(nGenes=20, nGenes1=1, nSNPlim=c(1, 20), nSNP0=1:3,
                           LOR=.2, rholim=c(0,0),
                           n=10, MAFlim=c(0.05, 0.4), p0=0.05) 
## End(Don't show)

# Simulation set up A b) in the paper
#simulb <- simPathAR1Snp(nGenes=20, nGenes1=1, nSNPlim=c(1, 100), nSNP0=1:3,
#                           LOR=.2, rholim=c(0,0),
#                           n=100, MAFlim=c(0.05, 0.4), p0=0.05)






