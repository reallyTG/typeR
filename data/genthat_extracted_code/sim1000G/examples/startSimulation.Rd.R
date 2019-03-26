library(sim1000G)


### Name: startSimulation
### Title: Starts and initializes the data structures required for a
###   simulation. A VCF file should be read beforehand with the function
###   readVCF.
### Aliases: startSimulation

### ** Examples

library("sim1000G")
library(gplots)

examples_dir = system.file("examples", package = "sim1000G")
vcf_file = file.path(examples_dir, "region.vcf.gz")

vcf = readVCF( vcf_file, maxNumberOfVariants = 100)


genetic_map_of_region = system.file(
   "examples",
   "chr4-geneticmap.txt",
   package = "sim1000G"
)

readGeneticMapFromFile(genetic_map_of_region)

pdf(file=tempfile())
plotRegionalGeneticMap(vcf$vcf[,2]+1)
dev.off()

startSimulation(vcf, totalNumberOfIndividuals = 200)




