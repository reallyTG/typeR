library(falconx)


### Name: getASCN.x
### Title: Getting Allele-specific DNA Copy Number
### Aliases: getASCN.x

### ** Examples

data(Example) 
cn = getASCN.x(readMatrix, biasMatrix, tauhat=tauhat)
 # cn$tauhat would give the indices of change-points.  
 # cn$ascn would give the estimated allele-specific copy numbers for each segment.
 # cn$Haplotype[[i]] would give the estimated haplotype for the major chromosome in segment i 
 # if this segment has different copy numbers on the two homologous chromosomes.



