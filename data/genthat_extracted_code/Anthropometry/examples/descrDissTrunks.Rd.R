library(Anthropometry)


### Name: descrDissTrunks
### Title: Description of the dissimilarities between women's trunks
### Aliases: descrDissTrunks
### Keywords: datasets

### ** Examples

#Database:
#As a toy example, only the first 25 individuals are used.
X <- descrDissTrunks[1:25,]
X <- as.matrix(X) 

#Computation of archetypes and archetypoids:
#For reproducing results, seed for randomness:
set.seed(2010) 
#Run archetype algorithm repeatedly from 1 to numArch archetypes:
#This is a toy example. In other situation, choose numArch=10 and numRep=20.
numArch <- 5 ; nrep <- 2
lass <- stepArchetypesRawData(data = X, numArch = 1:numArch, numRep = nrep, verbose = FALSE)
#To understand the warning messages, see the vignette of the
#archetypes package.  

#screeplot(lass)

numArchoid <- 3
res_archoids_ns <- archetypoids(numArchoid, X, huge = 200, step = FALSE, ArchObj = lass, 
                                nearest = "cand_ns", sequ = TRUE)



