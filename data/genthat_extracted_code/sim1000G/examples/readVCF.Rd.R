library(sim1000G)


### Name: readVCF
### Title: Read a vcf file, with options to filter out low or high
###   frequency markers.
### Aliases: readVCF

### ** Examples


examples_dir = system.file("examples", package = "sim1000G")
vcf_file = file.path(examples_dir,
  "region-chr4-93-TMEM156.vcf.gz")

vcf = readVCF( vcf_file, maxNumberOfVariants = 500 ,
               min_maf = 0.02 ,max_maf = NA)

str(as.list(vcf))



