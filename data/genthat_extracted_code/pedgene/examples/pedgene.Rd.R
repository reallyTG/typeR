library(pedgene)


### Name: pedgene
### Title: Compute Kernel and Burden Statistics for Pedigree Data (possibly
###   with unrelated subjects)
### Aliases: pedgene pedgene.stats print.pedgene summary.pedgene
### Keywords: kinship

### ** Examples

# example data with the same 10 variants for an autosome and X chromosome
# pedigree data on 39 subjects including 3 families and unrelateds
data(example.ped)
data(example.geno)
data(example.map)

# gene tests (chroms 1 and X) with male.dose=2
pg.m2 <- pedgene(example.ped, example.geno, example.map, male.dose=2)
# same genes, with male.dose=1
pg.m1 <- pedgene(example.ped, example.geno, example.map, male.dose=1)

## print and summary methods
print(pg.m2, digits=3)
summary(pg.m1, digits=3)



