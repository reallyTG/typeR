library(RKEEL)


### Name: CART_R
### Title: CART_R KEEL Regression Algorithm
### Aliases: CART_R R6_CART_R
### Keywords: regression

### ** Examples

data_train <- RKEEL::loadKeelDataset("autoMPG6_train")
data_test <- RKEEL::loadKeelDataset("autoMPG6_test")

#Create algorithm
algorithm <- RKEEL::CART_R(data_train, data_test)

#Run algorithm
algorithm$run()

#See results
algorithm$testPredictions



