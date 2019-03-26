library(penaltyLearning)


### Name: featureVector
### Title: featureVector
### Aliases: featureVector

### ** Examples


data(neuroblastoma, package="neuroblastoma", envir=environment())

one <- subset(neuroblastoma$profiles, profile.id=="1" & chromosome=="1")
(f.vec <- featureVector(one$logratio))




