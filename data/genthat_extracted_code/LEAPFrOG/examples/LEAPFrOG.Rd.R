library(LEAPFrOG)


### Name: LEAPFrOG
### Title: LEAPFrOG
### Aliases: LEAPFrOG

### ** Examples

#Example with nonsense data -
#10000 random SNP genotypes 
#...and uniform, random allele frequencies from two populations.
library(LEAPFrOG)
z1=LEAPFrOG(sample(0:2,10000,replace=TRUE),cbind(runif(10000,0,1),runif(10000,0,1)))
z1


