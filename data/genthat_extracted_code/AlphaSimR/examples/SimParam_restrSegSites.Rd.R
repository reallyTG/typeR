library(AlphaSimR)


### Name: SimParam_restrSegSites
### Title: Restrict segregating sites
### Aliases: SimParam_restrSegSites

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$restrSegSites(maxQtl=5, maxSnp=5)




