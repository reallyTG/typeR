library(vcfR)


### Name: VCF input and output
### Title: Read and write vcf format files
### Aliases: 'VCF input and output' read.vcfR write.vcf

### ** Examples

data(vcfR_test)
vcfR_test
head(vcfR_test)
# CRAN requires developers to us a tempdir when writing to the filesystem.
# You may want to implement this example elsewhere.
orig_dir <- getwd()
temp_dir <- tempdir()
setwd( temp_dir )
write.vcf( vcfR_test, file = "vcfR_test.vcf.gz" )
vcf <- read.vcfR( file = "vcfR_test.vcf.gz", verbose = FALSE )
vcf
setwd( orig_dir )





