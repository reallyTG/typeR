library(Digiroo2)


### Name: fAssocmatrix
### Title: Extract expected associations over multiple permutations
### Aliases: fAssocmatrix

### ** Examples


## Load required packages
library(adehabitatHR)

## Load data
data(StudyArea)
data(Roos)

## Convert df into a spatial points df object
coordinates(Roos) <- ~x+y

## Estimation of UD and KUD 95% for the 10 animals
ud <- kernelUD(Roos,h="href",same4all=TRUE)
ver95 <- getverticeshr(ud,95,unin = c("m"),unout=c("ha"))
udsgdf <- as(estUDm2spixdf(ud),"SpatialGridDataFrame")

## Run 1 permutation using only the first 5 individuals using random points taken 
## from within each individuals 95% KUD.
## Associations are determined if individuals are within 50 m from one another
fAssocmatrix(sPerm=1,
             Gprox=50,
             iextract=ver95,
             iID=1:5)

## Run 20 permutations using individuals accoring to sighting probability (ave no. roos seen on survey  = 6) 
## Probability-weighted random points are extracted according to the UD
## Associations are determined if individuals are within 50 m from one another

## Extract sighting probability

ID_counts <- tapply(rep(1,length(Roos[[1]])),Roos[[1]],sum)
No_SurveyDays <- 400

pObs <- as.vector(ID_counts)/No_SurveyDays # proportion of time individuals found on survey 
nameObs <- names(ID_counts) 
TotalAnimals <- 10 # Total number of animals in study
samplesize <- 6 # Number of IDs to include in simulations (with replacement)
bootlength <- 20 # Number of permutations

ExpProb <- data.frame(Kangaroo=nameObs,Probability=pObs) # Table of Expected Probabilities

## Generate ID combinations based on observation probability (with replacements)  
pID <- sapply(1:bootlength,function(i) sample(x=TotalAnimals,
                                              size=samplesize,
                                              replace=FALSE,
                                              prob=pObs))

## What individuals are contained in the first permutation?
nameObs[pID[,1]] 
## What individuals are contained in the last permutation?
nameObs[pID[,bootlength]]

## Run association matrix function to generate multiple permutations of 'expected' associations
AMud_50m <- fAssocmatrix(sPerm=1:bootlength,
             	         Gprox=50,
             	         iextract=udsgdf,
             	         iID=pID)



