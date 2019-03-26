library(optiSel)


### Name: completeness
### Title: Calculates Pedigree Completeness
### Aliases: completeness

### ** Examples


#Computes the pedigree completeness of Hinterwald cattle 
#born between 2006 and 2007 in each ancestral generation.

data(PedigWithErrors)
Pedig <- prePed(PedigWithErrors)
compl <- completeness(Pedig, keep=Pedig$Born %in% (2006:2007), maxd=50, by="Indiv")
head(compl)

#Summary statistics can be computed directly from the pedigree:
Summary <- summary(Pedig, keep=Pedig$Born %in% (2006:2007))
head(Summary)

hist(Summary$PCI,        xlim=c(0,1),  main="Pedigree Completeness")
hist(Summary$Inbreeding, xlim=c(0,1),  main="Inbreeding")
hist(Summary$equiGen,    xlim=c(0,20), main="Number of Equivalent Complete Generations")
hist(Summary$fullGen,    xlim=c(0,20), main="Number of Fully Traced Generations")
hist(Summary$maxGen,     xlim=c(0,20), main="Number of Maximum Generations Traced")

compl <- completeness(Pedig, keep=Pedig$Born %in% (2006:2007), maxd=50, by="Sex")
head(compl)

## Not run: 
##D library("ggplot2")
##D ggplot(compl, aes(Generation, Completeness, col=Sex))+geom_line()
## End(Not run)



