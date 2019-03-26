library(eqtl)


### Name: Rsq.2.array
### Title: Add R square data to peak.array data frame
### Aliases: Rsq.2.array

### ** Examples

data(seed10);

# Genome scan and QTL detection
out.em <- scanone(seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak(out.em, 'all');

# Computing additive effect
out.peak <- calc.adef(seed10,out.em,out.peak);

# Localizing peak
data(BSpgmap);
out.peak <- localize.qtl(seed10,out.peak,BSpgmap);
out.array <- peak.2.array(out.peak);

# R square computing
out.rsq <- calc.Rsq(seed10,out.peak);

# Adding R square data
out.array <- Rsq.2.array(out.rsq,out.array);




