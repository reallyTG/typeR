library(saasCNV)


### Name: cnv.data
### Title: Construct Data Frame for CNV Inference with NGS Data
### Aliases: cnv.data
### Keywords: CNV

### ** Examples

## load a data frame constructed from a vcf file with vcf2txt

## Not run: 
##D ## download vcf_table.txt.gz
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/vcf_table.txt.gz"
##D tryCatch({download.file(url=url, destfile="vcf_table.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="vcf_table.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D vcf_table <- read.delim(file="vcf_table.txt.gz", as.is=TRUE)
##D seq.data <- cnv.data(vcf=vcf_table, min.chr.probe=100, verbose=TRUE)
## End(Not run)

## see how seq.data looks like
data(seq.data)
head(seq.data)



