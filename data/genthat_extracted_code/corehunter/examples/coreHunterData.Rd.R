library(corehunter)


### Name: coreHunterData
### Title: Initialize Core Hunter data.
### Aliases: coreHunterData

### ** Examples

geno.file <- system.file("extdata", "genotypes.csv", package = "corehunter")
pheno.file <- system.file("extdata", "phenotypes.csv", package = "corehunter")
dist.file <- system.file("extdata", "distances.csv", package = "corehunter")

my.data <- coreHunterData(
  genotypes(file = geno.file, format = "default"),
  phenotypes(file = pheno.file),
  distances(file = dist.file)
)




