library(bedr)


### Name: read.vcf
### Title: Read a vcf into R
### Aliases: read.vcf
### Keywords: vcf

### ** Examples


clinVar.vcf.example      <- system.file("extdata/clinvar_dbSNP138_example.vcf.gz", package = "bedr")
singleSample.vcf.example <- system.file("extdata/singleSampleOICR_example.vcf.gz", package = "bedr")
multiSample.vcf.example  <- system.file("extdata/multiSampleOICR_example.vcf.gz", package = "bedr")

# read a subset of NCBI clinVar vcf.  Note this has no samples.
vcf1.a <- read.vcf(clinVar.vcf.example)
vcf1.b <- read.vcf(clinVar.vcf.example, split.info = TRUE)

## Not run: 
##D 
##D # same as above but split multiple samples
##D vcf1.c <- read.vcf(clinVar.vcf.example, split.info = TRUE, split.sample = TRUE) 
##D 
##D # read a single-sample VCF
##D system.time(
##D   vcf2.a <- read.vcf(singleSample.vcf.example, split.info = TRUE, split.sample = TRUE)
##D   )
##D 
##D # read a multi-sample VCF
##D vcf3.a <- read.vcf(multiSample.vcf.example, split.info = FALSE, split.sample = TRUE);
##D 
##D # multi core example
##D options("cores"=9);
##D vcf2.a <- read.vcf(singleSample.vcf.example, split.info = TRUE, split.sample = TRUE)
##D options("cores"=1);
##D 
## End(Not run)



