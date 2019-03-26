library(caret)


### Name: update.safs
### Title: Update or Re-fit a SA or GA Model
### Aliases: update.safs update.gafs
### Keywords: models

### ** Examples


## Not run: 
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
##D rf_search2 <- update(rf_search,
##D 	                 iter = 1,
##D 	                 x = train_data[, -ncol(train_data)],
##D                      y = train_data$Class)
##D rf_search2
## End(Not run)



