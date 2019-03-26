library(eqtl)


### Name: genoplot
### Title: Genome plot of the eQTL data on the expression traits locations
### Aliases: genoplot
### Keywords: hplot

### ** Examples

data(seed10);

seed10 <- calc.genoprob( cross=seed10, step=2, off.end=0, error.prob=0,
	 map.function='kosambi', stepwidth='fixed');
seed10 <- sim.geno( cross=seed10, step=2, off.end=0, error.prob=0,
	 map.function='kosambi', stepwidth='fixed');

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak( out.em, 'all');
out.peak <- calc.adef(seed10,out.em,out.peak);

data(BSpgmap);
data(ATH.coord);

out.peak <- localize.qtl(seed10, out.peak, BSpgmap);
out.array <- peak.2.array(out.peak)

genoplot(out.array, seed10, ATH.coord, BSpgmap,
	 chr.size=c(30432457,19704536,23470536,18584924,26991304), save.pict=TRUE);
# NB: the size of the Arabidopsis thaliana chromosomes are
# 30432457, 19704536, 23470536, 18584924 and 26991304 total base pairs
# for chromosomes 1 to 5 respectively



