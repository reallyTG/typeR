library(dawai)


### Name: predict.rlda
### Title: Restricted Linear Discriminant Analysis. Multivariate
###   Observations Classification
### Aliases: predict.rlda
### Keywords: multivariate classif

### ** Examples

data(Vehicle2)
levels(Vehicle2$Class)
## "bus" "opel" "saab" "van"

data <- Vehicle2
levels(data$Class) <- c(4, 2, 1, 3)  
## classes ordered by increasing size
## 
## according to variable definitions, we can 
## consider the following restrictions on the means vectors:
## mu11, mu21 >= mu31 >= mu41
## mu12, mu22 >= mu32 >= mu42
## 
## we have 6 restrictions, 3 predictors and 4 classes, so
## resmatrix must be a 6 x 12 matrix:

A <- matrix(0, ncol = 12, nrow = 6)
A[t(matrix(c(1, 1, 2, 2, 3, 4, 4, 5, 5, 7, 6, 8), nrow = 2))] <- -1
A[t(matrix(c(1, 7, 2, 8, 3, 7, 4, 8, 5, 10, 6, 11), nrow = 2))] <- 1

set.seed(983)
values <- runif(dim(data)[1])
trainsubset <- values < 0.2
testsubset <- values >= 0.2
obj <- rlda(Class ~ Kurt.Maxis + Holl.Ra + Sc.Var.maxis,
            data, subset = trainsubset, gamma = c(0, 0.5, 1),
            resmatrix = A)
pred <- predict(obj, newdata = data[testsubset,], 
                grouping = data[testsubset, "Class"],
                prior = rep(1/4, 4))
pred$error.rate
## we can see that the test error rate of the restricted
## rules decrease with gamma:
##                       gamma=0 gamma=0.5  gamma=1
## True error rate (%): 40.86957  39.71014 39.71014



