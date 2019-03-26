library(sim1000G)


### Name: subsetVCF
### Title: Generate a market subset of a vcf file
### Aliases: subsetVCF

### ** Examples


examples_dir = system.file("examples", package = "sim1000G")

vcf_file = file.path(examples_dir, "region-chr4-93-TMEM156.vcf.gz")

vcf = readVCF( vcf_file, maxNumberOfVariants = 500 ,
               min_maf = 0.02 ,max_maf = NA)

vcf2 = subsetVCF(vcf, var_index = 1:50)




