library(fam2r)


### Name: missing.person.plot
### Title: Plots hypotheses for family reunion
### Aliases: missing.person.plot internalID getSex

### ** Examples

data(grandmother)
pedigrees = grandmother$pedigrees
datamatrix = grandmother$datamatrix
datamatrix[3,]=1
loci = grandmother$loci
x1 = Familias2linkdat(pedigrees, datamatrix, loci)
missing.person.plot(x1[[1]],2, available="shaded", frametitles=c("",""), 
  newdev=TRUE, width=c(1,2), marker=1)



