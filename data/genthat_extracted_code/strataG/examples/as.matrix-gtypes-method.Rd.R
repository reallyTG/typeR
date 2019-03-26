library(strataG)


### Name: as.matrix,gtypes-method
### Title: Convert 'gtypes' To 'matrix'
### Aliases: as.matrix,gtypes-method as.matrix.gtypes as.matrix

### ** Examples

data(msats.g)

# with defaults (alleles in multiple columns, with ids and stratification)
mat <- as.matrix(msats.g)
head(mat)

# one column per locus
onecol.mat <- as.matrix(msats.g, one.col = TRUE)
head(onecol.mat)

# just the genotypes
genotypes.mat <- as.matrix(msats.g, one.col = TRUE, ids = FALSE, strata = FALSE)
head(genotypes.mat)




