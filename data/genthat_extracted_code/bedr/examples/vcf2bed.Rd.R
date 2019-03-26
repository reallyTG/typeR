library(bedr)


### Name: vcf2bed
### Title: convert a vcf to a bed file
### Aliases: vcf2bed
### Keywords: vcf

### ** Examples

clinVar.vcf.example <- system.file("extdata/clinvar_dbSNP138_example.vcf.gz", package = "bedr")
x <- read.vcf(clinVar.vcf.example)
x.bed <- vcf2bed(x)



