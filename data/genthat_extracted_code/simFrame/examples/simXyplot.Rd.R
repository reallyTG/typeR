library(simFrame)


### Name: simXyplot
### Title: X-Y plots
### Aliases: simXyplot simXyplot-methods simXyplot,SimResults-method
###   simxyplot SimXyplot Simxyplot simxyplot-methods SimXyplot-methods
###   Simxyplot-methods
### Keywords: hplot methods

### ** Examples

#### design-based simulation
set.seed(12345)  # for reproducibility
data(eusilcP)    # load data

## control objects for sampling and contamination
sc <- SampleControl(size = 500, k = 50)
cc <- DARContControl(target = "eqIncome", 
    epsilon = seq(0, 0.05, by = 0.01), 
    fun = function(x) x * 25)

## function for simulation runs
sim <- function(x) {
    c(mean = mean(x$eqIncome), trimmed = mean(x$eqIncome, 0.05))
}

## run simulation
results <- runSimulation(eusilcP, 
    sc, contControl = cc, fun = sim)

## plot results
tv <- mean(eusilcP$eqIncome)  # true population mean
simXyplot(results, true = tv)



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
    epsilon = seq(0, 0.05, by = 0.01), 
    dots = list(mean = 15))

## function for simulation runs
sim <- function(x) {
    c(mean = mean(x$value), 
        trimmed = mean(x$value, trim = 0.05), 
        median = median(x$value))
}

## run simulation
results <- runSimulation(dc, nrep = 50, 
    contControl = cc, design = "group", fun = sim)

## plot results
simXyplot(results, true = means)



