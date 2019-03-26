library(simFrame)


### Name: runSimulation
### Title: Run a simulation experiment
### Aliases: runSimulation runSimulation-methods
###   runSimulation,ANY,ANY,ANY,missing-method
###   runSimulation,data.frame,missing,missing,SimControl-method
###   runSimulation,data.frame,missing,numeric,SimControl-method
###   runSimulation,data.frame,SampleSetup,missing,SimControl-method
###   runSimulation,data.frame,VirtualSampleControl,missing,SimControl-method
###   runSimulation,VirtualDataControl,missing,missing,SimControl-method
###   runSimulation,VirtualDataControl,missing,numeric,SimControl-method
###   runSimulation,VirtualDataControl,VirtualSampleControl,missing,SimControl-method
###   runSimulation,VirtualDataControl,VirtualSampleControl,numeric,SimControl-method
###   runSim runsimulation Runsimulation RunSimulation
###   runsimulation-methods Runsimulation-methods RunSimulation-methods
### Keywords: design methods

### ** Examples

#### design-based simulation
set.seed(12345)  # for reproducibility
data(eusilcP)    # load data

## control objects for sampling and contamination
sc <- SampleControl(size = 500, k = 50)
cc <- DARContControl(target = "eqIncome", epsilon = 0.02, 
    fun = function(x) x * 25)

## function for simulation runs
sim <- function(x) {
    c(mean = mean(x$eqIncome), trimmed = mean(x$eqIncome, 0.02))
}

## run simulation and explore results
results <- runSimulation(eusilcP, 
    sc, contControl = cc, fun = sim)
head(results)
aggregate(results)
tv <- mean(eusilcP$eqIncome)  # true population mean
plot(results, true = tv)



#### model-based simulation
set.seed(12345)  # for reproducibility

## function for generating data
rgnorm <- function(n, means) {
    group <- sample(1:2, n, replace=TRUE)
    data.frame(group=group, value=rnorm(n) + means[group])
}

## control objects for data generation and contamination
means <- c(0, 0.25)
dc <- DataControl(size = 500, distribution = rgnorm, 
    dots = list(means = means))
cc <- DCARContControl(target = "value", 
    epsilon = 0.02, dots = list(mean = 15))

## function for simulation runs
sim <- function(x) {
    c(mean = mean(x$value), 
        trimmed = mean(x$value, trim = 0.02), 
        median = median(x$value))
}

## run simulation and explore results
results <- runSimulation(dc, nrep = 50, 
    contControl = cc, design = "group", fun = sim)
head(results)
aggregate(results)
plot(results, true = means)



