library(falconx)


### Name: falconx
### Title: Finding Allele-Specific Copy Number in Whole-Exome Sequencing
###   Data
### Aliases: falconx

### ** Examples

data(Example) 
 # tauhat = getChangepoints.x(readMatrix, biasMatrix)  # uncomment this to run the function. 
cn = getASCN.x(readMatrix, biasMatrix, tauhat=tauhat)
 # cn$tauhat would give the indices of change-points.  
 # cn$ascn would give the estimated allele-specific copy numbers for each segment.
 # cn$Haplotype[[i]] would give the estimated haplotype for the major chromosome in segment i 
 # if this segment has different copy numbers on the two homologous chromosomes.
view(cn)



