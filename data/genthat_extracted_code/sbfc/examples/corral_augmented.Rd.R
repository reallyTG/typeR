library(sbfc)


### Name: corral_augmented
### Title: Augmented corral data set: synthetic data with correlated
###   attributes augmented with noise features
### Aliases: corral_augmented
### Keywords: datasets

### ** Examples

corral_result = sbfc(data=list(TrainX=corral_augmented$TrainX[,1:6],
                                         TrainY = corral_augmented$TrainY))
corral100_result = sbfc(data=list(TrainX=corral_augmented$TrainX[,1:100], 
                                  TrainY = corral_augmented$TrainY))
corral_result = sbfc(data=list(TrainX=corral_augmented$TrainX[,1:6],
                                         TrainY = corral_augmented$TrainY))
corral100_result = sbfc(data=list(TrainX=corral_augmented$TrainX[,1:100], 
                                  TrainY = corral_augmented$TrainY))



