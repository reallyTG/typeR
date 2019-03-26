library(eqtl)


### Name: calc.adef
### Title: Compute the additive effect at each QTL marker
### Aliases: calc.adef
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

# Additive effect computing
out.peak <- calc.adef(seed10,out.em,out.peak,round=3);

# Additive effect of the QTLs affecting the 26th trait
# and localized on chromosome 1
out.peak[[26]]$'4'$additive.effect;

# Peak's features describing the QTLs affecting the 26th trait
# and localized on chromosome 1
out.peak[[26]]$'4';

# idem for the trait 'CATrck'
out.peak$CATrck
out.peak$CATrck$'4'
out.peak$CATrck$'4'$additive.effect



