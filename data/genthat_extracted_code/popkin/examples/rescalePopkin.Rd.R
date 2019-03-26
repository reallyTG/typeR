library(popkin)


### Name: rescalePopkin
### Title: Rescale kinship matrix to set a given kinship value to zero.
### Aliases: rescalePopkin

### ** Examples

## Construct toy data
X <- matrix(c(0,1,2,1,0,1,1,0,2), nrow=3, byrow=TRUE) # genotype matrix
subpops <- c(1,1,2) # subpopulation assignments for individuals
subpops2 <- 1:3 # alternate labels treat every individual as a different subpop

## NOTE: for BED-formatted input, use BEDMatrix!
## "file" is path to BED file (excluding .bed extension)
# library(BEDMatrix)
# X <- BEDMatrix(file) # load genotype matrix object

## suppose we first estimate kinship without subpopulations, which will be more biased
Phi <- popkin(X) # calculate kinship from genotypes, WITHOUT subpops
## then we visualize this matrix, figure out a reasonable subpopulation partition

## now we can adjust the kinship matrix!
Phi2 <- rescalePopkin(Phi, subpops)
## prev is faster but otherwise equivalent to re-estimating Phi from scratch with subpops:
## Phi2 <- popkin(X, subpops) 

## can also manually set the level of relatedness phiMin we want to be zero:
phiMin <- min(Phi) # a naive choice for example
Phi2 <- rescalePopkin(Phi, phiMin=phiMin)

## lastly, omiting both subpops and phiMin sets the minimum value in Phi to zero
Phi3 <- rescalePopkin(Phi2)
## equivalent to both of:
## Phi3 <- popkin(X)
## Phi3 <- rescalePopkin(Phi2, phiMin=min(Phi))




