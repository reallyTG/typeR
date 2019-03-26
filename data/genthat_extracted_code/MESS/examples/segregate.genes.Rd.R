library(MESS)


### Name: segregate.genes
### Title: Segregate genes through a pedigree
### Aliases: segregate.genes
### Keywords: datagen

### ** Examples


library(kinship2)
mydata <- data.frame(id=1:5, 
                     dadid=c(NA, NA, 1, 1, 1), 
                     momid=c(NA, NA, 2, 2, 2), 
                     sex=c("male", "female", "male", "male", "male"), 
                     famid=c(1,1,1,1,1))
relation <- data.frame(id1=c(3), id2=c(4), famid=c(1), code=c(1))
ped <- pedigree(id=mydata$id, dadid=mydata$dadid, momid=mydata$momid, 
                sex=mydata$sex, relation=relation)
segregate.genes(ped, c(.1, .3, .5))




