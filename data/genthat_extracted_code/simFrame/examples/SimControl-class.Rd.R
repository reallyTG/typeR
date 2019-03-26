library(simFrame)


### Name: SimControl-class
### Title: Class "SimControl"
### Aliases: SimControl-class SimControl getContControl,SimControl-method
###   setContControl,SimControl-method getNAControl,SimControl-method
###   setNAControl,SimControl-method getDesign,SimControl-method
###   setDesign,SimControl-method getFun,SimControl-method
###   setFun,SimControl-method getDots,SimControl-method
###   setDots,SimControl-method getSAE,SimControl-method
###   setSAE,SimControl-method show,SimControl-method simControl-class
###   simcontrol-class Simcontrol-class simControl simcontrol Simcontrol
### Keywords: classes

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

## combine these to "SimControl" object and run simulation
ctrl <- SimControl(contControl = cc, fun = sim)
results <- runSimulation(eusilcP, sc, control = ctrl)

## explore results
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

## combine these to "SimControl" object and run simulation
ctrl <- SimControl(contControl = cc, design = "group", fun = sim)
results <- runSimulation(dc, nrep = 50, control = ctrl)

## explore results
head(results)
aggregate(results)
plot(results, true = means)



