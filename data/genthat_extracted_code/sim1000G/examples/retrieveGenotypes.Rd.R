library(sim1000G)


### Name: retrieveGenotypes
### Title: Retrieve a matrix of simulated genotypes for a specific set of
###   individual IDs
### Aliases: retrieveGenotypes

### ** Examples


library("sim1000G")

examples_dir = system.file("examples", package = "sim1000G")
vcf_file = file.path(examples_dir, "region.vcf.gz")
vcf = readVCF( vcf_file, maxNumberOfVariants = 100 ,
               min_maf = 0.12 ,max_maf = NA)

# For realistic data use the function downloadGeneticMap
generateUniformGeneticMap()

startSimulation(vcf, totalNumberOfIndividuals = 200)

ped1 = newNuclearFamily(1)

retrieveGenotypes(ped1$gtindex)




