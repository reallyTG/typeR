library(qtl)


### Name: pull.draws
### Title: Pull out the genotype imputations from a cross
### Aliases: pull.draws
### Keywords: utilities

### ** Examples

data(listeria)
listeria <- sim.geno(listeria, step=5, stepwidth="max", n.draws=8)
dr <- pull.draws(listeria, chr=c(5,13))
dr[1:20,1:10,1]



