library(CALIBERrfimpute)


### Name: makemar
### Title: Creates artificial missing at random missingness
### Aliases: makemar

### ** Examples

set.seed(1)
mydata <- simdata(n=100)
mymardata <- makemar(mydata, prop=0.1)
# Count the number of missing values
sapply(mymardata, function(x){sum(is.na(x))})
# y x1 x2 x3 x4 
# 0 11 10  0  0 



