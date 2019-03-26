library(dawai)


### Name: rqda
### Title: Restricted Quadratic Discriminant Analysis
### Aliases: rqda rqda.formula rqda.default rqda.data.frame rqda.matrix
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
obj <- rqda(data, grouping, subset = trainsubset,
            gamma = (1:5)/5, restext = "s>1,2,3")
obj
## we can see that the apparent error rate of the restricted
## rules increase with gamma:
## gamma=0.2 gamma=0.4 gamma=0.6 gamma=0.8   gamma=1
##  30.40936  30.99415  30.99415  30.99415  31.57895



