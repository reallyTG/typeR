library(qtl)


### Name: geno.table
### Title: Create table of genotype distributions
### Aliases: geno.table
### Keywords: utilities

### ** Examples

data(listeria)
geno.table(listeria)

geno.table(listeria, chr=13)

gt <- geno.table(listeria)
gt[gt$P.value < 0.01,]

out <- geno.table(listeria, scanone.output=TRUE)
plot(out)
plot(out, lod=2)



