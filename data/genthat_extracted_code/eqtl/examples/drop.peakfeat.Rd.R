library(eqtl)


### Name: drop.peakfeat
### Title: Erase peak features in peak object
### Aliases: drop.peakfeat
### Keywords: utilities

### ** Examples


data(seed10);

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk')
out.peak <- define.peak(out.em,lodcolumn='CATrck');
out.peak <- calc.adef(seed10,out.em,out.peak)

out.peak;

data(BSpgmap);
out.peak <- localize.qtl(seed10,out.peak,BSpgmap);

out.peak;

out.peak <- drop.peakfeat(out.peak,'additive.effect');
out.peak <- drop.peakfeat(out.peak,c('inf.bp','sup.bp'));

out.peak;



