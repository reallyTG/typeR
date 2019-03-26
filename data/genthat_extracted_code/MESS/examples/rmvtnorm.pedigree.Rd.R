library(MESS)


### Name: rmvtnorm.pedigree
### Title: Simulate residual multivariate Gaussian data from a polygenic
###   model
### Aliases: rmvtnorm.pedigree
### Keywords: datagen

### ** Examples


library(kinship2)
library(mvtnorm)
mydata <- data.frame(id=1:5,
                     dadid=c(NA, NA, 1, 1, 1),
                     momid=c(NA, NA, 2, 2, 2),
                     sex=c("male", "female", "male", "male", "male"),
                     famid=c(1,1,1,1,1))
relation <- data.frame(id1=c(3), id2=c(4), famid=c(1), code=c(1))
ped <- pedigree(id=mydata$id, dadid=mydata$dadid, momid=mydata$momid,
                sex=mydata$sex, relation=relation)
rmvtnorm.pedigree(2, ped, h2=.25)




