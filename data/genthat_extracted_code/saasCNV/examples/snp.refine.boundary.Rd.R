library(saasCNV)


### Name: snp.refine.boundary
### Title: Refine Segment Boundaries
### Aliases: snp.refine.boundary
### Keywords: CNV SNP array

### ** Examples

## Not run: 
##D ## download snp.data.RData
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/snp.data.RData"
##D tryCatch({download.file(url=url, destfile="snp.data.RData")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="snp.data.RData", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D load("snp.data.RData")
##D data(snp.cnv)
##D snp.cnv.refine <- snp.refine.boundary(data=snp.data, segs.stat=snp.cnv)
## End(Not run)

## how the results look like
data(snp.cnv.refine)
head(snp.cnv.refine)



