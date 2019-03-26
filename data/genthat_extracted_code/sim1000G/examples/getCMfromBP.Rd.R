library(sim1000G)


### Name: getCMfromBP
### Title: Converts centimorgan position to base-pair. Return a list of
###   centimorgan positions that correspond to the bp vector (in
###   basepairs).
### Aliases: getCMfromBP

### ** Examples


library("sim1000G")

examples_dir = system.file("examples", package = "sim1000G")
vcf_file = sprintf("%s/region.vcf.gz", examples_dir)
vcf = readVCF( vcf_file, maxNumberOfVariants = 100,
  min_maf = 0.12)

# For realistic data use the function downloadGeneticMap
generateUniformGeneticMap()
getCMfromBP(seq(1e6,100e6,by=1e6))





