library(eqtl)


### Name: map.peak
### Title: Summaries maximum LOD peak position from peak object
### Aliases: map.peak
### Keywords: print

### ** Examples

data(seed10);

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak(out.em, 'all');

covar <- map.peak(out.peak);

covar;



