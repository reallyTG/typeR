library(bedr)


### Name: write.vcf
### Title: write a vcf object
### Aliases: write.vcf
### Keywords: vcf

### ** Examples


vcf  <- read.vcf(system.file("extdata/clinvar_dbSNP138_example.vcf.gz", package = "bedr"));
vcf$header <- c(vcf$header, NOTE="vcf processed by bedr")

## Not run: 
##D   write.vcf(vcf, filename = paste(tempdir(), "/bedr.example.vcf", sep = ""));
##D   
## End(Not run)



