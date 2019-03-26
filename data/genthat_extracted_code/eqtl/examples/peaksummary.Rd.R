library(eqtl)


### Name: peaksummary
### Title: Print summary of QTL definition
### Aliases: peaksummary
### Keywords: print

### ** Examples

data(seed10);

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak(out.em,'all');
out.peak <- calc.adef(seed10,out.em,out.peak);

data(BSpgmap);
out.peak <- localize.qtl(seed10,out.peak,BSpgmap);
out.array <- peak.2.array(out.peak);

# Whole QTL summary woth graph
par(mfrow=c(2,4));
peaksummary( out.array, seed10, graph=TRUE);
par(mfrow=c(1,1));

# QTL summary with graphs excluding the QTLs localized
# on chromosome 3 between 5000 and 6000 bp.
par(mfrow=c(2,4));
peaksummary( out.array, seed10, exc=data.frame(inf=5000,sup=6000,chr=3), graph=TRUE);
par(mfrow=c(1,1));



