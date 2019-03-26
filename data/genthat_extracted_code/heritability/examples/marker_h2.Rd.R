library(heritability)


### Name: marker_h2
### Title: Compute a marker-based estimate of heritability, given
###   phenotypic observations at individual plant or plot level.
### Aliases: marker_h2
### Keywords: heritability narrow-sense marker-based

### ** Examples

data(LD)
data(K_atwell)
# Heritability estimation for all observations:
#out <- marker_h2(data.vector=LD$LD,geno.vector=LD$genotype,
#                 covariates=LD[,4:8],K=K_atwell)
# Heritability estimation for a randomly chosen subset of 20 accessions:
set.seed(123)
sub.set <- which(LD$genotype %in% sample(levels(LD$genotype),20))
out <- marker_h2(data.vector=LD$LD[sub.set],geno.vector=LD$genotype[sub.set],
                 covariates=LD[sub.set,4:8],K=K_atwell)



