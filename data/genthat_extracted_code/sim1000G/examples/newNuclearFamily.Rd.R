library(sim1000G)


### Name: newNuclearFamily
### Title: Simulates genotypes for 1 family with 1 offspring
### Aliases: newNuclearFamily

### ** Examples


library("sim1000G")

examples_dir = system.file("examples", package = "sim1000G")
vcf_file = file.path(examples_dir, "region.vcf.gz")
vcf = readVCF( vcf_file, maxNumberOfVariants = 100 ,
   min_maf = 0.12 ,max_maf = NA)

genetic_map_of_region = system.file("examples",
   "chr4-geneticmap.txt",
   package = "sim1000G")
readGeneticMapFromFile(genetic_map_of_region)

startSimulation(vcf, totalNumberOfIndividuals = 1200)
fam1 = newNuclearFamily(1)
fam2 = newNuclearFamily(2)

# See also the documentation on our github page




