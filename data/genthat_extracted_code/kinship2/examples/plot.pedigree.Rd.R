library(kinship2)


### Name: plot.pedigree
### Title: plot pedigrees
### Aliases: plot.pedigree
### Keywords: hplot, genetics

### ** Examples

data(sample.ped)

pedAll <- pedigree(sample.ped$id, sample.ped$father, sample.ped$mother, 
       sample.ped$sex,  #affected=sample.ped$affected,
       affected=cbind(sample.ped$affected, sample.ped$avail), 
       famid=sample.ped$ped)

ped2 <- pedAll['2']

print(ped2)


## plot(ped2)




