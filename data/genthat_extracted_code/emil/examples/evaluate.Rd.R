library(emil)


### Name: evaluate
### Title: Evaluate a modeling procedure
### Aliases: evaluate

### ** Examples

x <- iris[-5]
y <- iris$Species
cv <- resample("crossvalidation", y, nfold = 4, nrepeat = 4)
result <- evaluate("lda", x, y, resample=cv)

# Multiple procedures fitted and tested simultaneously. 
# This is useful when the dataset is large and the splitting takes a long time.
# If you name the elements of the list emil will also name the elements of the
# results object in the same way.
result <- evaluate(c(Linear = "lda", Quadratic = "qda"), x, y, resample=cv)

# Multicore parallelization (on a single computer)
result <- evaluate("lda", x, y, resample=cv, .cores=2)

# Parallelization using a cluster (not limited to a single computer)
# PSOCK is supported on windows too!
require(parallel)
cl <- makePSOCKcluster(2)
clusterEvalQ(cl, library(emil))
clusterExport(cl, c("x", "y"))
result <- parLapply(cl, cv, function(fold)
    evaluate("lda", x, y, resample=fold))
stopCluster(cl)



