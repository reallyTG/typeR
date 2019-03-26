library(repfdr)


### Name: SNPlocations
### Title: Three GWAS studies SNPs locations and data
### Aliases: SNPlocations
### Keywords: datasets Replicability GWAS

### ** Examples

data(SNPlocations)
head(SNPlocations)

## Not run: 
##D download.file('http://www.math.tau.ac.il/~ruheller/repfdr_RData/zmat.RData',destfile = "zmat.RData")
##D load(file = "zmat.RData")
##D 
##D input.to.repfdr <- ztobins(zmat, 3, df= 15)
##D pbz <- input.to.repfdr$pdf.binned.z
##D bz  <- input.to.repfdr$binned.z.mat
## End(Not run)



