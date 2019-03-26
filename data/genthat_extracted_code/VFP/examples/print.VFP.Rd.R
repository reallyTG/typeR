library(VFP)


### Name: print.VFP
### Title: Print Objects of Class 'VFP'
### Aliases: print.VFP

### ** Examples

## No test: 
library(VCA)
data(CA19_9)
fits.CA19_9 <- anovaVCA(result~site/day, CA19_9, by="sample")
# extract repeatability
mat.CA19_9 <- getMat.VCA(fits.CA19_9, "error")
res.CA19_9 <- fit.vfp(mat.CA19_9, 1:10)
res.CA19_9
## End(No test)



