library(RGCCA)


### Name: Russett
### Title: Russett data
### Aliases: Russett
### Keywords: datasets

### ** Examples

#Loading of the Russett dataset
data(Russett)
#Russett is partitioned into three blocks (X_agric, X_ind, X_polit)
X_agric =as.matrix(Russett[,c("gini","farm","rent")])
X_ind = as.matrix(Russett[,c("gnpr","labo")])
X_polit = as.matrix(Russett[ , c("inst", "ecks", "death", "demostab", 
                                 "demoinst", "dictator")])
A = list(X_agric, X_ind, X_polit)
lapply(A, dim)



