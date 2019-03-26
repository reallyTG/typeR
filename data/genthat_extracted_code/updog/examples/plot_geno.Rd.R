library(updog)


### Name: plot_geno
### Title: Make a genotype plot.
### Aliases: plot_geno

### ** Examples

data("snpdat")
refvec  <- snpdat$counts[snpdat$snp == "SNP1"]
sizevec <- snpdat$size[snpdat$snp == "SNP1"]
ploidy  <- 6
plot_geno(refvec = refvec, sizevec = sizevec, ploidy = ploidy)




