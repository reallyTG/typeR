library(sim1000G)


### Name: generateUnrelatedIndividuals
### Title: Generates variant data for n unrelated individuals
### Aliases: generateUnrelatedIndividuals

### ** Examples


library("sim1000G")

examples_dir = system.file("examples", package = "sim1000G")
vcf_file = file.path(examples_dir, "region.vcf.gz")
vcf = readVCF( vcf_file, maxNumberOfVariants = 100 , min_maf = 0.12)

genetic_map_of_region =
   system.file("examples",
     "chr4-geneticmap.txt",
     package = "sim1000G")

readGeneticMapFromFile(genetic_map_of_region)

startSimulation(vcf, totalNumberOfIndividuals = 1200)
ids = generateUnrelatedIndividuals(20)

# See also the documentation on our github page




