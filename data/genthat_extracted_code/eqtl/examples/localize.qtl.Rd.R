library(eqtl)


### Name: localize.qtl
### Title: Compute QTL physical positions from QTL genetic positions
### Aliases: localize.qtl
### Keywords: models

### ** Examples

data(seed10);

# Genome scan and QTL detection
out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak(out.em, 'all');

# Additive effect computing
out.peak <- calc.adef(seed10,out.em,out.peak,round=3);

# Localizing peaks
data(BSpgmap);
out.peak <- localize.qtl( seed10, out.peak, BSpgmap, round=0);

# Peak features describing the QTLs affecting the 100th trait and
# localized on the chromosome 1
out.peak[[26]]$'4';

# Genetic and physical position of maximum LOD peaks affecting the 100th trait and
# localized on chromosome 1
out.peak[[26]]$'4'$peak.cM;
out.peak[[26]]$'4'$peak.bp;

# Genetic and physical position of QTLs' SI inferior bounds of the 100th trait and
# localized on chromosome 1
out.peak[[26]]$'4'$inf.cM;
out.peak[[26]]$'4'$inf.bp;

# Genetic and physical position of QTLs' SI superior bounds of the 100th trait and
# localized on chromosome 1
out.peak[[26]]$'4'$sup.cM;
out.peak[[26]]$'4'$sup.bp;

# idem for trait 'CATrck'
out.peak$CATrck$'4'$peak.cM;
out.peak$CATrck$'4'$peak.bp;
out.peak$CATrck$'4'$inf.cM;
out.peak$CATrck$'4'$inf.bp;
out.peak$CATrck$'4'$sup.cM;
out.peak$CATrck$'4'$sup.bp;




