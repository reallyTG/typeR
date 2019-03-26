library(popkin)


### Name: popkin
### Title: Estimate kinship from a genotype matrix and subpopulation
###   assignments
### Aliases: popkin

### ** Examples

## Construct toy data
X <- matrix(c(0,1,2,1,0,1,1,0,2), nrow=3, byrow=TRUE) # genotype matrix
subpops <- c(1,1,2) # subpopulation assignments for individuals

## NOTE: for BED-formatted input, use BEDMatrix!
## "file" is path to BED file (excluding .bed extension)
# library(BEDMatrix)
# X <- BEDMatrix(file) # load genotype matrix object

Phi <- popkin(X, subpops) # calculate kinship from genotypes and subpopulation labels




