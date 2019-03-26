library(kinship2)


### Name: plot.pedigree.shrink
### Title: plot pedigree.shrink object that is a shrunk pedigree object
### Aliases: plot.pedigree.shrink

### ** Examples

data(sample.ped)

fam2 <- sample.ped[sample.ped$ped==2,]
ped2 <- pedigree(fam2$id, fam2$father, fam2$mother, fam2$sex,
                 fam2$affected, fam2$avail)

shrink2 <- pedigree.shrink(ped2,avail=fam2$avail)
shrink2

plot(ped2)

plot.pedigree.shrink(shrink2, title="Sample Pedigree 2")







