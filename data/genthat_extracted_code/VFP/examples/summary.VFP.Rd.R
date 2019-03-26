library(VFP)


### Name: summary.VFP
### Title: Summary Objects of Class 'VFP'
### Aliases: summary.VFP

### ** Examples

## No test: 
library(VCA)
data(CA19_9)
fits.CA19_9 <- anovaVCA(result~site/day, CA19_9, by="sample")
# extract repeatability
mat.CA19_9 <- getMat.VCA(fits.CA19_9, "error")
res.CA19_9 <- fit.vfp(mat.CA19_9, 1:10)
summary(res.CA19_9)
print(res.CA19_9)
## End(No test)



