library(simFrame)


### Name: clusterRunSimulation
### Title: Run a simulation experiment on a cluster
### Aliases: clusterRunSimulation clusterRunSimulation-methods
###   clusterRunSimulation,ANY,ANY,ANY,ANY,missing-method
###   clusterRunSimulation,ANY,data.frame,missing,numeric,SimControl-method
###   clusterRunSimulation,ANY,data.frame,SampleSetup,missing,SimControl-method
###   clusterRunSimulation,ANY,data.frame,VirtualSampleControl,missing,SimControl-method
###   clusterRunSimulation,ANY,VirtualDataControl,missing,numeric,SimControl-method
###   clusterRunSimulation,ANY,VirtualDataControl,VirtualSampleControl,numeric,SimControl-method
###   clusterrunsimulation clusterRunsimulation clusterrunSimulation
###   ClusterRunSimulation Clusterrunsimulation ClusterrunSimulation
###   ClusterRunsimulation
### Keywords: design methods

### ** Examples

## Not run: 
##D ## these examples requires at least a dual core processor
##D 
##D 
##D ## design-based simulation
##D data(eusilcP)  #load data
##D 
##D # start cluster
##D cl <- makeCluster(2, type = "PSOCK")
##D 
##D # load package and data on workers
##D clusterEvalQ(cl, {
##D     library(simFrame)
##D     data(eusilcP)
##D })
##D 
##D # set up random number stream
##D clusterSetRNGStream(cl, iseed = "12345")
##D 
##D # control objects for sampling and contamination
##D sc <- SampleControl(size = 500, k = 50)
##D cc <- DARContControl(target = "eqIncome", epsilon = 0.02, 
##D     fun = function(x) x * 25)
##D 
##D # function for simulation runs
##D sim <- function(x) {
##D     c(mean = mean(x$eqIncome), trimmed = mean(x$eqIncome, 0.02))
##D }
##D 
##D # export objects to workers
##D clusterExport(cl, c("sc", "cc", "sim"))
##D 
##D # run simulation on cluster
##D results <- clusterRunSimulation(cl, eusilcP, 
##D     sc, contControl = cc, fun = sim)
##D 
##D # stop cluster
##D stopCluster(cl)
##D 
##D # explore results
##D head(results)
##D aggregate(results)
##D tv <- mean(eusilcP$eqIncome)  # true population mean
##D plot(results, true = tv)
##D 
##D 
##D 
##D ## model-based simulation
##D 
##D # start cluster
##D cl <- makeCluster(2, type = "PSOCK")
##D 
##D # load package on workers
##D clusterEvalQ(cl, library(simFrame))
##D 
##D # set up random number stream
##D clusterSetRNGStream(cl, iseed = "12345")
##D 
##D # function for generating data
##D rgnorm <- function(n, means) {
##D     group <- sample(1:2, n, replace=TRUE)
##D     data.frame(group=group, value=rnorm(n) + means[group])
##D }
##D 
##D # control objects for data generation and contamination
##D means <- c(0, 0.25)
##D dc <- DataControl(size = 500, distribution = rgnorm, 
##D     dots = list(means = means))
##D cc <- DCARContControl(target = "value", 
##D     epsilon = 0.02, dots = list(mean = 15))
##D 
##D # function for simulation runs
##D sim <- function(x) {
##D     c(mean = mean(x$value), 
##D         trimmed = mean(x$value, trim = 0.02), 
##D         median = median(x$value))
##D }
##D 
##D # export objects to workers
##D clusterExport(cl, c("rgnorm", "means", "dc", "cc", "sim"))
##D 
##D # run simulation on cluster
##D results <- clusterRunSimulation(cl, dc, nrep = 100, 
##D     contControl = cc, design = "group", fun = sim)
##D 
##D # stop cluster
##D stopCluster(cl)
##D 
##D # explore results
##D head(results)
##D aggregate(results)
##D plot(results, true = means)
## End(Not run)



