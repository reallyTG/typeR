library(polyRAD)


### Name: MakeTasselVcfFilter
### Title: Filter Lines of a VCF File By Call Rate and Allele Frequency
### Aliases: MakeTasselVcfFilter
### Keywords: file

### ** Examples

# make the filtering function
filterfun <- MakeTasselVcfFilter(300, 15)

## No test: 
# Executable code excluded from CRAN testing for taking >10 s:

require(VariantAnnotation)
# get the example VCF installed with polyRAD
exampleVCF <- system.file("extdata", "Msi01genes.vcf", package = "polyRAD")
exampleBGZ <- paste(exampleVCF, "bgz", sep = ".")

# zip and index the file using Tabix (if not done already)
if(!file.exists(exampleBGZ)){
  exampleBGZ <- bgzip(exampleVCF)
  indexTabix(exampleBGZ, format = "vcf")
}

# filter to a new file
filterVcf(exampleBGZ, destination = "Msi01genes_filtered.vcf", 
          prefilters = FilterRules(list(filterfun)))
## End(No test)



