library(haplo.stats)


### Name: geno.count.pairs
### Title: Counts of Total Haplotype Pairs Produced by Genotypes
### Aliases: geno.count.pairs

### ** Examples

data(hla.demo)
genohla <- hla.demo[,c(17,18,21:24)]
geno <- setupGeno(genohla)
count.geno <- geno.count.pairs(geno)
print(count.geno)



