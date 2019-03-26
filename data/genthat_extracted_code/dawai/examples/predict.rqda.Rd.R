library(dawai)


### Name: predict.rqda
### Title: Restricted Quadratic Discriminant Analysis. Multivariate
###   Observations Classification
### Aliases: predict.rqda
### Keywords: multivariate classif

### ** Examples

data(Vehicle2)
levels(Vehicle2$Class)
## "bus" "opel" "saab" "van"

data <- Vehicle2[, 1:4]
grouping = Vehicle2$Class
levels(grouping) <- c(4, 2, 1, 3)
## classes ordered by increasing size
## 
## according to variable definitions, we can consider 
## the following restrictions on the means vectors:
## mu11 >= mu21 >= mu31 >= mu41
## mu12 >= mu22 >= mu32 >= mu42
## mu13 >= mu23 >= mu33 >= mu43
## 
## we can specify these restrictions by restext = "s>1,2,3"

set.seed(7964)
values <- runif(dim(data)[1])
trainsubset <- values < 0.2
testsubset <- values >= 0.2
obj <- rqda(data, grouping, subset = trainsubset,
            gamma = (1:5)/5, restext = "s>1,2,3")
pred <- predict(obj, newdata = data[testsubset,], 
                grouping = grouping[testsubset])
pred$error.rate
## we can see that the test error rate of the restricted
## rules decrease with gamma:
##                      gamma=0.2 gamma=0.4 gamma=0.6 gamma=0.8  gamma=1
## True error rate (%):  40.14815  39.85185  39.85185  39.11111 39.11111



