library(eqtl)


### Name: cleanphe
### Title: Remove undesired phenotypes and LOD results from cross and
###   scanone object respectively
### Aliases: cleanphe
### Keywords: utilities

### ** Examples

data(seed10);

# Genotype probabilities and genome scan
## Not run: 
##D seed10 <- calc.genoprob( cross=seed10, step=2, off.end=0, error.prob=0, 
##D 	 map.function='kosambi', stepwidth='fixed');
## End(Not run)
out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');

# Clean cross object and genome scan
seed10 <- cleanphe(seed10,'Buffer');
seed10 <- cleanphe(seed10,'ctrl');

out.em <- cleanphe(out.em,'Buffer');
out.em <- cleanphe(out.em,'ctrl');



