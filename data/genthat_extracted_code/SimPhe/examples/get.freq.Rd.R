library(SimPhe)


### Name: get.freq
### Title: Calculate the gene(allele) frequency
### Aliases: get.freq

### ** Examples

# genotype file: rows are individuals and columns are SNPs
fgeno.path <- system.file("extdata", "10SNP.txt", package="SimPhe")

# get genotype
geno <- read.geno(fgeno.path, ftype = "snp.head")

get.freq(geno, epistasis.pars)



