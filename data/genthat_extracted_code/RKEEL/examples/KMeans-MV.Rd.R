library(RKEEL)


### Name: KMeans_MV
### Title: KMeans_MV KEEL Preprocess Algorithm
### Aliases: KMeans_MV R6_KMeans_MV
### Keywords: preprocess

### ** Examples

data_train <- RKEEL::loadKeelDataset("car_train")
data_test <- RKEEL::loadKeelDataset("car_test")

#Create algorithm
algorithm <- RKEEL::KMeans_MV(data_train, data_test)

#Run algorithm
algorithm$run()

#See results
algorithm$preprocessed_test



