library(dawai)


### Name: err.est.rqda
### Title: Restricted Quadratic Discriminant Analysis. True Error Rate
###   Estimation
### Aliases: err.est.rqda
### Keywords: multivariate classif

### ** Examples

data(Vehicle2)
levels(Vehicle2$Class)
## "bus" "opel" "saab" "van"

data = Vehicle2[, c("Kurt.Maxis", "Holl.Ra", "Sc.Var.maxis")]
grouping = Vehicle2$Class
levels(grouping) <- c(3, 1, 1, 2)  
## now we can consider the following restrictions:
## mu11 >= mu21 >= mu31
## mu12 >= mu22 >= mu32
## 
## we can specify these restrictions by restext = "s>1,2"

set.seed(5561)
values <- runif(length(rownames(data)))
trainsubset <- values < 0.05
testsubset <- values >= 0.05
obj <- rqda(data, grouping, subset = trainsubset, restext = "s>1,2")
pred <- predict(obj, data[testsubset,], grouping = grouping[testsubset],
                prior = c(1/3, 1/3,1/3))
pred$error.rate
err.est(obj, 30, prior = c(1/3, 1/3, 1/3))



