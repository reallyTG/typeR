library(kinship2)


### Name: pedigree.legend
### Title: Plot a pedigree legend
### Aliases: pedigree.legend
### Keywords: pedigree

### ** Examples

data(sample.ped)

fam1 <- sample.ped[sample.ped$ped==1,]

ped1 <- with(fam1, pedigree(id, father, mother, sex,
                 affected=cbind(avail,affected)))

plot(ped1)
pedigree.legend(ped1, location="bottomright", radius=.8)
pedigree.legend(ped1, location="topleft", radius=.6, cex=1.2)

pedigree.legend(ped1, new=FALSE)





