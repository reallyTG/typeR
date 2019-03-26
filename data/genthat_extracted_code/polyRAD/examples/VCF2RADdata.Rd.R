library(polyRAD)


### Name: VCF2RADdata
### Title: Create a RADdata Object from a VCF File
### Aliases: VCF2RADdata
### Keywords: file

### ** Examples

# get the example VCF installed with polyRAD
exampleVCF <- system.file("extdata", "Msi01genes.vcf", package = "polyRAD")

## No test: 
# loading VariantAnnotation namespace takes >10s,
# so is excluded from CRAN checks

require(VariantAnnotation)

# Compress and index the VCF before reading, if not already done
if(!file.exists(paste(exampleVCF, "bgz", sep = "."))){
  vcfBG <- bgzip(exampleVCF)
  indexTabix(vcfBG, "vcf")
}

# Read into RADdata object
myRAD <- VCF2RADdata(exampleVCF, expectedLoci = 100, expectedAlleles = 500)

# Example of subsetting by genomic region (first 200 kb on Chr01)
mysv <- ScanVcfParam(fixed = "ALT", info = NA, geno = "AD",
                     samples = samples(scanVcfHeader(exampleVCF)),
                     which = GRanges("01", IRanges(1, 200000)))
myRAD2 <- VCF2RADdata(exampleVCF, expectedLoci = 100, expectedAlleles = 500,
                      svparam = mysv, yieldSize = NA_integer_)
## End(No test)



