library(msgl)


### Name: msgl-package
### Title: Multinomial logistic regression with sparse group lasso penalty.
### Aliases: msgl-package

### ** Examples

# Load some data
data(PrimaryCancers)

# A quick look at the data
dim(x)
table(classes)

# A smaller subset with three classes 
small <- which(classes %in% c("CCA", "CRC", "Pancreas"))
classes <- classes[small, drop = TRUE]
x <- x[small, ]

#Do cross validation using 2 parallel units
cl <- makeCluster(2)
registerDoParallel(cl)

# Do 4-fold cross validation on a lambda sequence of length 100.
# The sequence is decreasing from the data derived lambda.max to 0.2*lambda.max
fit.cv <- msgl::cv(x, classes, fold = 4, lambda = 0.2, use_parallel = TRUE)

stopCluster(cl)

# Print information about models
# and cross validation errors (estimated expected generalization error)
fit.cv



