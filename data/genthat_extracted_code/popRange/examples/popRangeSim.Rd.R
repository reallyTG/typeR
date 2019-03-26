library(popRange)


### Name: popRangeSim
### Title: popRangeSim
### Aliases: popRangeSim

### ** Examples
 
## Example: In this scenario, we are simulating a 3x3 grid of populations for 50 
## generations. Each population starts with 100 diploid individuals. Each individual 
## has a 0.01 probability of migrating away from their populations. There are 100 
## SNPs that all have a starting frequency of 0.5, and the program outputs the standard 
## "results" file, as well as a PLINK file. 

## Commands

mat = matrix(1,nrow=3,ncol=3) 
popRangeSim(world = mat, popSize = 100, diploid = TRUE, nGens = 50,
              mig = 0.01, SNP_model = 0, nSNPs = 100, SNPs_starting_freq = 0.5, 
              outfile= "outFile1", PLINK=TRUE)




