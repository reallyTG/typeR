library(penaltyLearning)


### Name: featureMatrix
### Title: featureMatrix
### Aliases: featureMatrix

### ** Examples


data(neuroblastoma, package="neuroblastoma", envir=environment())

one <- subset(neuroblastoma$profiles, profile.id %in% c(1,2))
f.mat <- featureMatrix(one, c("profile.id", "chromosome"), "logratio")




