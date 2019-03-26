library(corehunter)


### Name: corehunter
### Title: Core Hunter 3
### Aliases: corehunter corehunter-package

### ** Examples

## Not run: 
##D # sample core based on genetic marker data (default format)
##D geno.file <- system.file("extdata", "genotypes.csv", package = "corehunter")
##D geno <- genotypes(file = geno.file, format = "default")
##D core <- sampleCore(geno)
##D 
##D # sample core based on genetic marker data (biparental format)
##D geno.file <- system.file("extdata", "genotypes-biparental.csv", package = "corehunter")
##D geno <- genotypes(file = geno.file, format = "biparental")
##D core <- sampleCore(geno)
##D 
##D # sample core based on genetic marker data (frequency format)
##D geno.file <- system.file("extdata", "genotypes-frequency.csv", package = "corehunter")
##D geno <- genotypes(file = geno.file, format = "frequency")
##D core <- sampleCore(geno)
##D 
##D # sample core based on phenotypic traits
##D pheno.file <- system.file("extdata", "phenotypes.csv", package = "corehunter")
##D pheno <- phenotypes(file = pheno.file)
##D core <- sampleCore(pheno)
##D 
##D # sample core based on precomputed distance matrix
##D dist.file <- system.file("extdata", "distances.csv", package = "corehunter")
##D dist <- distances(file = dist.file)
##D core <- sampleCore(dist)
##D 
##D # sample core from genotypes with custom objective (allelic richness)
##D core <- sampleCore(geno, obj = objective("HE"))
##D 
##D # sample core from genotypes with custom size and objective (representativeness)
##D core <- sampleCore(geno, obj = objective("AN", "MR"), size = 0.1)
##D 
##D # sample core from genotypes with custom size and stop condition
##D core <- sampleCore(geno, size = 0.1, impr.time = 2)
##D 
##D # sample core based on both genotypes and phenotypes
##D geno.pheno <- coreHunterData(geno, pheno)
##D core <- sampleCore(geno.pheno)
## End(Not run)




