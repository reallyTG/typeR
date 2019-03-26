library(eqtl)


### Name: cim.peak
### Title: Genome scan using previously detected QTLs as covariates
### Aliases: cim.peak
### Keywords: models

### ** Examples

data(seed10);

## Not run: 
##D seed10 <- calc.genoprob( cross=seed10, step=2, off.end=0, error.prob=0,
##D 	 map.function='kosambi', stepwidth='fixed');
##D seed10 <- sim.geno( cross=seed10, step=2, off.end=0, error.prob=0,
##D 	 map.function='kosambi', stepwidth='fixed');
## End(Not run)

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak(out.em, 'all');
out.cem <- cim.peak(seed10,out.peak);



