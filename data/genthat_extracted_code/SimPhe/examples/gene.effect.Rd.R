library(SimPhe)


### Name: gene.effect
### Title: Get genetic effect
### Aliases: gene.effect

### ** Examples

# genotype file: rows are individuals and columns are SNPs
fgeno.path <- system.file("extdata", "10SNP.txt", package="SimPhe")

# get genotype
geno <- read.geno(fgeno.path, ftype = "snp.head")

# take a look at geno and gene.coef
geno
gene.coefficients

# get gene effects
gene.effect(geno, gene.coefficients)



