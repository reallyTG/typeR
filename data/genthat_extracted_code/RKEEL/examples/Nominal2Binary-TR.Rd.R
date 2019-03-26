library(RKEEL)


### Name: Nominal2Binary_TR
### Title: Nominal2Binary_TR KEEL Preprocess Algorithm
### Aliases: Nominal2Binary_TR R6_Nominal2Binary_TR
### Keywords: preprocess

### ** Examples

data_train <- RKEEL::loadKeelDataset("car_train")
data_test <- RKEEL::loadKeelDataset("car_test")

#Create algorithm
algorithm <- RKEEL::Nominal2Binary_TR(data_train, data_test)

#Run algorithm
algorithm$run()

#See results
algorithm$preprocessed_test



