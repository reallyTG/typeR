library(popkin)


### Name: inbrDiag
### Title: Replace kinship diagonal with inbreeding coefficients
### Aliases: inbrDiag

### ** Examples

## Construct toy data
X <- matrix(c(0,1,2,1,0,1,1,0,2), nrow=3, byrow=TRUE) # genotype matrix
subpops <- c(1,1,2) # subpopulation assignments for individuals

## NOTE: for BED-formatted input, use BEDMatrix!
## "file" is path to BED file (excluding .bed extension)
# library(BEDMatrix)
# X <- BEDMatrix(file) # load genotype matrix object

## estimate the kinship matrix "Phi" from the genotypes "X"!
Phi <- popkin(X, subpops) # calculate kinship from X and optional subpop labels

## lastly, replace diagonal of kinship matrix with inbreeding coefficients
PhiMod <- inbrDiag(Phi)




