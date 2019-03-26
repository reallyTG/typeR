library(kinship2)


### Name: pedigree.shrink
### Title: Trim a pedigree to specified bit size with priority placed on
###   trimming uninformative subjects.
### Aliases: pedigree.shrink print.pedigree.shrink
### Keywords: pedigree

### ** Examples

data(sample.ped)

fam1 <- sample.ped[sample.ped$ped==1,]
ped1 <- pedigree(fam1$id, fam1$father, fam1$mother, fam1$sex,
                 fam1$affected)

shrink1 <- pedigree.shrink(ped=ped1, avail=fam1$avail, maxBits=25)

print(shrink1)
## plot(ped1)
## plot(shrink1, title="Sample Pedigree 1")


fam2 <- sample.ped[sample.ped$ped==2,]
ped2 <- pedigree(fam2$id, fam2$father, fam2$mother, fam2$sex,
                 fam2$affected)

shrink2 <- pedigree.shrink(ped2, avail=fam2$avail)

## plot(ped2)
## plot(shrink2, title="Sample Pedigree 2")
print(shrink2)





