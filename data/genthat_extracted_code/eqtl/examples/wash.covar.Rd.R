library(eqtl)


### Name: wash.covar
### Title: Erase additive covariates LOD peaks on the LOD curve
### Aliases: wash.covar
### Keywords: models

### ** Examples

data(seed10);

out.em <- scanone( seed10, pheno.col=1:5, model='normal', method='hk');
out.peak <- define.peak( out.em, 'all');

covar <- map.peak(out.peak)

out.cem <- cim.peak(seed10,out.peak);
out.cem <- wash.covar(out.cem,covar);

out_composite.peak <- define.peak(out.cem,'all');



