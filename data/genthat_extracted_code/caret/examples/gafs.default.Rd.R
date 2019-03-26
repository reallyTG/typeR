library(caret)


### Name: gafs.default
### Title: Genetic algorithm feature selection
### Aliases: gafs.default gafs
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1)
##D train_data <- twoClassSim(100, noiseVars = 10)
##D test_data  <- twoClassSim(10,  noiseVars = 10)
##D 
##D ## A short example
##D ctrl <- gafsControl(functions = rfGA,
##D                     method = "cv",
##D                     number = 3)
##D 
##D rf_search <- gafs(x = train_data[, -ncol(train_data)],
##D                   y = train_data$Class,
##D                   iters = 3,
##D                   gafsControl = ctrl)
##D 
##D rf_search
##D   
## End(Not run)




