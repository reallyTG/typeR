library(eqtl)


### Name: calc.Rsq
### Title: Estimate R square of individual QTLs and QTL interactions
### Aliases: calc.Rsq
### Keywords: models

### ** Examples

data(seed10);

# Genotype probabilities
## Not run: 
##D seed10 <- calc.genoprob( cross=seed10, step=2, off.end=0, error.prob=0,
##D 	 map.function='kosambi', stepwidth='fixed');
##D seed10 <- sim.geno( cross=seed10, step=2, off.end=0, error.prob=0,
##D 	 map.function='kosambi', stepwidth='fixed');
## End(Not run)

# Genome scan and QTL detection
out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak(out.em, 'all');

# R square computing
out.rsq <- calc.Rsq(seed10,out.peak);

# R square computing without taking account of any significance
out.rsq <- calc.Rsq(seed10,out.peak,th=1);




