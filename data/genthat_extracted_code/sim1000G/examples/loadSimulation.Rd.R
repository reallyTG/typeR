library(sim1000G)


### Name: loadSimulation
### Title: Load some previously saved simulation data by function
###   saveSimulation
### Aliases: loadSimulation

### ** Examples



examples_dir = system.file("examples", package = "sim1000G")
vcf_file = file.path(examples_dir, "region.vcf.gz")

vcf = readVCF( vcf_file, maxNumberOfVariants = 100 ,
           min_maf = 0.12 ,max_maf = NA)

# For a realistic genetic map
# use the function readGeneticMap
generateUniformGeneticMap()

startSimulation(vcf, totalNumberOfIndividuals = 200)

ped1 = newNuclearFamily(1)

saveSimulation("sim1")

vcf = readVCF( vcf_file, maxNumberOfVariants = 100 ,
               min_maf = 0.02 ,max_maf = 0.5)

startSimulation(vcf, totalNumberOfIndividuals = 200)
saveSimulation("sim2")

loadSimulation("sim1")






