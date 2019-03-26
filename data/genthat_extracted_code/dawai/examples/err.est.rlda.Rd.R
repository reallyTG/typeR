library(dawai)


### Name: err.est.rlda
### Title: Restricted Linear Discriminant Analysis. True Error Rate
###   estimation
### Aliases: err.est.rlda
### Keywords: multivariate classif

### ** Examples

data(Vehicle2)
levels(Vehicle2$Class)
## "bus" "opel" "saab" "van"

data = Vehicle2[, c("Holl.Ra", "Sc.Var.maxis")]
grouping = Vehicle2$Class
levels(grouping) <- c(3, 1, 1, 2)  
## now we can consider the following restrictions:
## mu11 >= mu21 >= mu31
## 
## we can specify these restrictions by restext = "s>1"

set.seed(-1007)
values <- runif(length(rownames(data)))
trainsubset <- values < 0.05
testsubset <- values >= 0.05
obj <- rlda(data, grouping, subset = trainsubset, restext = "s>1")
pred <- predict(obj, data[testsubset,], grouping = grouping[testsubset],
                prior = c(1/3, 1/3,1/3))
pred$error.rate
err.est(obj, 30, prior = c(1/3, 1/3, 1/3))



