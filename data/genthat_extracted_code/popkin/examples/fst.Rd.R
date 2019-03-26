library(popkin)


### Name: fst
### Title: Extract FST from a population-level kinship matrix or vector of
###   inbreeding coefficients
### Aliases: fst

### ** Examples

## Get FST from a genotype matrix

## Construct toy data
X <- matrix(c(0,1,2,1,0,1,1,0,2), nrow=3, byrow=TRUE) # genotype matrix
subpops <- c(1,1,2) # subpopulation assignments for individuals

## NOTE: for BED-formatted input, use BEDMatrix!
## "file" is path to BED file (excluding .bed extension)
# library(BEDMatrix)
# X <- BEDMatrix(file) # load genotype matrix object

## estimate the kinship matrix "Phi" from the genotypes "X"!
Phi <- popkin(X, subpops) # calculate kinship from X and optional subpop labels
w <- weightsSubpops(subpops) # can weigh individuals so subpopulations are balanced
Fst <- fst(Phi, w) # use kinship matrix and weights to calculate fst

Fst <- fst(Phi) # no weights implies uniform weights

inbr <- inbr(Phi) # if you extracted inbr for some other analysis...
Fst <- fst(inbr, w) # ...use this inbreeding vector as input too!




