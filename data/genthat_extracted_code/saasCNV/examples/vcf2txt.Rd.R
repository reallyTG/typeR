library(saasCNV)


### Name: vcf2txt
### Title: Covert VCF File to A Data Frame
### Aliases: vcf2txt
### Keywords: vcf VCF

### ** Examples

## Not run: 
##D ## an example VCF file from WES
##D ## download WES_example.vcf.gz
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/WES_example.vcf.gz"
##D tryCatch({download.file(url=url, destfile="WES_example.vcf.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="WES_example.vcf.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D ## convert VCf file to a data frame
##D vcf_table <- vcf2txt(vcf.file="WES_example.vcf.gz", normal.col=9+1, tumor.col=9+2)
##D 
##D ## see how vcf_table looks like
##D ## download vcf_table.txt.gz
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/vcf_table.txt.gz"
##D tryCatch({download.file(url=url, destfile="vcf_table.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="vcf_table.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D vcf_table <- read.delim(file="vcf_table.txt.gz", as.is=TRUE)
##D head(vcf_table)
## End(Not run)




