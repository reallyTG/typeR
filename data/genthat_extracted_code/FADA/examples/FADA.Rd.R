library(FADA)


### Name: FADA
### Title: Factor Adjusted Discriminant Analysis 3-4 : Supervised
###   classification on decorrelated data
### Aliases: FADA

### ** Examples

data(data.train)
data(data.test)

# When testing data set is provided
res = decorrelate.train(data.train)
res2 = decorrelate.test(res, data.test)
classif = FADA(res2,method="sda",sda.method="lfdr")

### Not run 
# When no testing data set is provided
# Classification error rate is computed by a K-fold cross validation.
# res = decorrelate.train(data.train)
# classif = FADA(res, method="sda",sda.method="lfdr")



