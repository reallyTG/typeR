library(eqtl)


### Name: classify.qtl
### Title: Estimate the acting type of expression QTL
### Aliases: classify.qtl
### Keywords: models

### ** Examples

data(seed10);

# Genotype probabilities
## Not run: 
##D seed10 <- calc.genoprob( cross=seed10, step=2, off.end=0, error.prob=0,
##D 	map.function='kosambi', stepwidth='fixed');
##D seed10 <- sim.geno( cross=seed10, step=2, off.end=0, error.prob=0,
##D 	map.function='kosambi', stepwidth='fixed');
## End(Not run)

# Genome scan and QTL detection
out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak( out.em, 'all');

# Additive effect computing and peaks localization
out.peak <- calc.adef(seed10,out.em,out.peak);
data(BSpgmap);
out.peak <- localize.qtl(seed10,out.peak,BSpgmap);

# Estimated actind-type of the expression QTL affecting
# the 100th expression trait and localized on chromosome 1
data(ATH.coord)
out.peak <- classify.qtl(seed10,out.peak,ATH.coord,BSpgmap);
out.peak[[26]]$'4'$type;

# idem for the trait 'CATrck'
out.peak$CATrck$'4'$type;




