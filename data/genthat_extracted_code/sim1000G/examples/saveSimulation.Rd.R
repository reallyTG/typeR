library(sim1000G)


### Name: saveSimulation
### Title: Save the data for a simulation for later use. When simulating
###   multiple populations it allows saving and restoring of simulation
###   data for each population.
### Aliases: saveSimulation

### ** Examples




examples_dir = system.file("examples", package = "sim1000G")

vcf_file = file.path(examples_dir, "region.vcf.gz")
vcf = readVCF( vcf_file, maxNumberOfVariants = 100 ,
               min_maf = 0.12 ,max_maf = NA)


# For realistic data use the functions downloadGeneticMap
generateUniformGeneticMap()

startSimulation(vcf, totalNumberOfIndividuals = 200)

ped1 = newNuclearFamily(1)

saveSimulation("sim1")




