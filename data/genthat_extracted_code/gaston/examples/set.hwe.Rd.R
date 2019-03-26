library(gaston)


### Name: set.hwe
### Title: Hardy-Weinberg Equilibrium
### Aliases: set.hwe
### Keywords: Hardy-Weinberg P-value

### ** Examples

# Load data
data(LCT)
x <- as.bed.matrix(LCT.gen, LCT.fam, LCT.bim)

# Compute Hardy-Weinberg p-values
x <- set.hwe(x)
head( x@snps[,c("id","hwe")] )



