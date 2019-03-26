library(eqtl)


### Name: cover.peak
### Title: List QTLs within a genetical region from a peak object
### Aliases: cover.peak
### Keywords: print

### ** Examples

data(seed10);

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak( out.em, 'all');

# return the list of QTL which colocalize at 4 cM on chromosome 3
my_peak <- cover.peak(out.peak,pos=4,chr=3,pre=0);
my_peak;

# return the list of QTL which colocalize on the genetic region 4cM-6cM
# on chromosome 4
my_peak <- cover.peak(out.peak,pos=5,chr=4,pre=1);
my_peak;



