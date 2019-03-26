library(eqtl)


### Name: plotRsq
### Title: Plot R square data
### Aliases: plotRsq
### Keywords: hplot

### ** Examples

data(seed10);

seed10 <- calc.genoprob( cross=seed10, step=2, off.end=0, error.prob=0,
	map.function='kosambi', stepwidth='fixed');
seed10 <- sim.geno( cross=seed10, step=2, off.end=0, error.prob=0,
	map.function='kosambi', stepwidth='fixed');

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak(out.em,'all');
out.rsq <- calc.Rsq(seed10,out.peak);

# plotting R quare data
plotRsq(out.rsq);
plotRsq(out.rsq,par=c(1,3));



