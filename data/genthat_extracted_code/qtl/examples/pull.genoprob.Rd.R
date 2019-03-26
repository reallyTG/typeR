library(qtl)


### Name: pull.genoprob
### Title: Pull out the genotype probabilities from a cross
### Aliases: pull.genoprob
### Keywords: utilities

### ** Examples

data(listeria)
listeria <- calc.genoprob(listeria, step=1, stepwidth="max")
pr <- pull.genoprob(listeria, chr=c(5,13), omit.first.prob=TRUE, include.pos.info=TRUE, rotate=TRUE)
pr[1:5,1:10]



