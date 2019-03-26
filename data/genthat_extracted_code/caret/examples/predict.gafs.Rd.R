library(caret)


### Name: predict.gafs
### Title: Predict new samples
### Aliases: predict.gafs predict.safs
### Keywords: multivariate

### ** Examples


## Not run: 
##D 
##D set.seed(1)
##D train_data <- twoClassSim(100, noiseVars = 10)
##D test_data  <- twoClassSim(10,  noiseVars = 10)
##D 
##D ## A short example
##D ctrl <- safsControl(functions = rfSA,
##D                     method = "cv",
##D                     number = 3)
##D 
##D rf_search <- safs(x = train_data[, -ncol(train_data)],
##D                   y = train_data$Class,
##D                   iters = 3,
##D                   safsControl = ctrl)
##D 
##D rf_search
##D 
##D predict(rf_search, train_data)
## End(Not run)




