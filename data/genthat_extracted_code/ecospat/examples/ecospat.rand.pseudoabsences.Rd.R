library(ecospat)


### Name: ecospat.rand.pseudoabsences
### Title: Sample Pseudo-Absences
### Aliases: ecospat.rand.pseudoabsences

### ** Examples

glob <- ecospat.testData[2:8]
presence <- ecospat.testData[c(2:3,9)]
presence <- presence[presence[,3]==1,1:2]
ecospat.rand.pseudoabsences (nbabsences=10, glob=glob, colxyglob=1:2, colvar = "all", 
presence= presence, colxypresence=1:2, mindist=20)



