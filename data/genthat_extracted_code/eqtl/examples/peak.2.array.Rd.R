library(eqtl)


### Name: peak.2.array
### Title: Build a simple array from a peak object
### Aliases: peak.2.array
### Keywords: print

### ** Examples

data(seed10);

# Defining QTLs for all traits
out.em <- scanone( seed10, pheno.col=1:50, model='normal', method='hk');
out.peak <- define.peak( out.em, 'all',graph=TRUE,save.pict=TRUE);

## Not run: 
##D out.array <- peak.2.array(out.peak);
##D # Computing additive effect
##D out.peak <- calc.adef(seed10,out.em,out.peak);
##D # Localizing peak
##D data(BSpgmap);
##D out.peak <- localize.qtl(seed10,out.peak,BSpgmap);
## End(Not run)

out.array <- peak.2.array(out.peak);



