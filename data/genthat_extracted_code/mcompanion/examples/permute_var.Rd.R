library(mcompanion)


### Name: permute_var
### Title: Permute rows and columns of matrices
### Aliases: permute_var permute_synch
### Keywords: matrices

### ** Examples

Cl <- cor(longley) # from example for 'cor()'
nc <- ncol(Cl)
v <- 1:nc
names(v) <- colnames(Cl)

permute_var(Cl)
all(permute_var(Cl) == Cl[ncol(Cl):1, ncol(Cl):1])



