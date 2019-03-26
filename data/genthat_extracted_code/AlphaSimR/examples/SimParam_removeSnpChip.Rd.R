library(AlphaSimR)


### Name: SimParam_removeSnpChip
### Title: Remove SNP chip
### Aliases: SimParam_removeSnpChip

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addSnpChip(10)
SP$nSnpChips
SP$removeSnpChip(1)
SP$nSnpChips




