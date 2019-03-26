library(sim1000G)


### Name: generateSingleRecombinationVector
### Title: Genetates a recombination vector arising from one meiotic event.
###   The origin of segments is coded as (0 - haplotype1 , 1 - haplotype2 )
### Aliases: generateSingleRecombinationVector

### ** Examples


library("sim1000G")

examples_dir = system.file("examples", package = "sim1000G")
vcf_file = file.path(examples_dir, "region.vcf.gz")
vcf = readVCF( vcf_file, maxNumberOfVariants = 100 ,
               min_maf = 0.12 ,max_maf = NA)

# For realistic data use the function downloadGeneticMap
generateUniformGeneticMap()
generateSingleRecombinationVector( 1:100 )




