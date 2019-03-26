library(falcon)


### Name: falcon
### Title: Finding Allele-Specific Copy Number in Next-Generation
###   Sequencing Data
### Aliases: falcon

### ** Examples

data(Example) 
# tauhat = getChangepoints(readMatrix)  # uncomment this to run the function. 
 # This example has 6309 variant loci and it took 94 seconds to run on a laptop with 
 # Intel Core i5-2410M processor.
cn = getASCN(readMatrix, tauhat=tauhat)
 # cn$tauhat would give the indices of change-points.  
 # cn$ascn would give the estimated allele-specific copy numbers for each segment.
 # cn$Haplotype[[i]] would give the estimated haplotype for the major chromosome in segment i 
 # if this segment has different copy numbers on the two homologous chromosomes.
view(cn)



