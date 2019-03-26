library(eqtl)


### Name: define.peak
### Title: Defines the QTL with support interval and exclusionary window
### Aliases: define.peak
### Keywords: models

### ** Examples

data(seed10);

out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');

################################################
# Detecting QTL with LOD drop support interval #
################################################

# Defining QTLs for all traits and saving the curves in png files.
out.peak <- define.peak(out.em, 'all',graph=TRUE,save.pict=TRUE,round=3);

# Defining QTLs for few traits and drawing the curves.
par(mfrow=c(1,5));
out.peak <- define.peak(out.em,lodcolumn=c(3,4,40,49),graph=TRUE,round=3);
par(mfrow=c(1,1));

# Defining QTLs for one trait and drawing the curves.
out.peak <- define.peak(out.em,lodcolumn='CATrck',graph=TRUE,round=3);



