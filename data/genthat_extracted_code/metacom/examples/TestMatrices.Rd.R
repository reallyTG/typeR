library(metacom)


### Name: TestMatrices
### Title: Test matrices used to evaluate metacommunity functions
### Aliases: TestMatrices
### Keywords: datasets

### ** Examples


#load list containing interaction matrices
data(TestMatrices)

length(TestMatrices)
names(TestMatrices)

#image plot of interaction matrix, using the Imagine() function
test <- TestMatrices[[6]]
Imagine(test, fill=FALSE, order=TRUE)





