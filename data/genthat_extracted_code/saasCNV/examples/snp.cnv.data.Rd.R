library(saasCNV)


### Name: snp.cnv.data
### Title: Construct Data Frame for CNV Inference with SNP Array Data
### Aliases: snp.cnv.data
### Keywords: CNV

### ** Examples

## Not run: 
##D ## an example data with LRR and BAF information
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/snp_table.txt.gz"
##D tryCatch({download.file(url=url, destfile="snp_table.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="snp_table.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D snp_table <- read.delim(file="snp_table.txt.gz", as.is=TRUE)
##D snp.data <- snp.cnv.data(snp=snp_table, min.chr.probe=100, verbose=TRUE) 
##D 
##D ## see how seq.data looks like
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/snp.data.RData"
##D tryCatch({download.file(url=url, destfile="snp.data.RData")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="snp.data.RData", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D load("snp.data.RData")
##D head(snp.data)
## End(Not run)




