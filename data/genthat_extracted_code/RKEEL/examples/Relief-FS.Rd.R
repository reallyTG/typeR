library(RKEEL)


### Name: Relief_FS
### Title: Relief_FS KEEL Preprocess Algorithm
### Aliases: Relief_FS R6_Relief_FS
### Keywords: preprocess

### ** Examples

data_train <- RKEEL::loadKeelDataset("car_train")
data_test <- RKEEL::loadKeelDataset("car_test")

#Create algorithm
algorithm <- RKEEL::Relief_FS(data_train, data_test)

#Run algorithm
algorithm$run()

#See results
algorithm$preprocessed_test



