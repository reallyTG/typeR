library(muHVT)


### Name: predictHVT
### Title: predictHVT
### Aliases: predictHVT
### Keywords: predict

### ** Examples

data(USArrests)
#Split in train and test

train <- USArrests[1:40,]
test <- USArrests[41:50,]

hvt.results <- list()
hvt.results <- HVT(train, nclust = 3, depth = 2, quant.err = 0.2, 
                  projection.scale = 10, normalize = TRUE)

predictions <- predictHVT(test,hvt.results,hmap.cols = NULL, child.level=2)
print(predictions$predictions)



