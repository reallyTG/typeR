library(UBL)


### Name: ENNClassif
### Title: Edited Nearest Neighbor for multiclass imbalanced problems
### Aliases: ENNClassif
### Keywords: pre-processing classification

### ** Examples


# generate an small imbalanced data set
  ir<- iris[-c(95:130), ]
# use ENN technique with different metrics, number of neighbours and classes
  ir1norm <- ENNClassif(Species~., ir, k = 5, dist = "p-norm", 
                        p = 1, Cl = "all")
  irEucl <- ENNClassif(Species~., ir) # defaults to Euclidean distance
  irCheby <- ENNClassif(Species~., ir, k = 7, dist = "Chebyshev",
                       Cl = c("virginica", "setosa"))
  irHVDM <- ENNClassif(Species~., ir, k = 3, dist = "HVDM")
# checking the impact
  summary(ir$Species)
  summary(ir1norm[[1]]$Species)
  summary(irEucl[[1]]$Species)
  summary(irCheby[[1]]$Species)
  summary(irHVDM[[1]]$Species)
# check the removed indexes of the ir1norm data set
  ir1norm[[2]]



