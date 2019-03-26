library(optiSel)


### Name: summary.Pedig
### Title: Calculates Summary Statistics for Pedigrees.
### Aliases: summary.Pedig

### ** Examples

data(PedigWithErrors)
Pedig <- prePed(PedigWithErrors)
Summary <- summary(Pedig, keep.only=Pedig$Born %in% (2006:2007))
head(Summary)

hist(Summary$PCI,        xlim=c(0,1),  main="Pedigree Completeness")
hist(Summary$Inbreeding, xlim=c(0,1),  main="Inbreeding")
hist(Summary$equiGen,    xlim=c(0,20), main="Number of Equivalent Complete Generations")
hist(Summary$fullGen,    xlim=c(0,20), main="Number of Fully Traced Generations")
hist(Summary$maxGen,     xlim=c(0,20), main="Number of Maximum Generations Traced")



