library(caret)


### Name: plot.gafs
### Title: Plot Method for the gafs and safs Classes
### Aliases: plot.gafs plot.safs
### Keywords: hplot

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
##D                   iters = 50,
##D                   safsControl = ctrl)
##D 
##D plot(rf_search)
##D plot(rf_search,
##D 	 output = "lattice",
##D 	 auto.key = list(columns = 2))
##D 
##D plot_data <- plot(rf_search, output = "data")
##D summary(plot_data)
##D     
## End(Not run)




