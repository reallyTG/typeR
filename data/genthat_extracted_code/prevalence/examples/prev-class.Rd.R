library(prevalence)


### Name: prev-class
### Title: Class '"prev"'
### Aliases: prev-class
### Keywords: classes

### ** Examples

## Taenia solium cysticercosis in Nepal
SE <- list(dist = "uniform", min = 0.60, max = 1.00)
SP <- list(dist = "uniform", min = 0.75, max = 1.00)
TP <- truePrev(x = 142, n = 742, SE = SE, SP = SP)

## Summarize estimates per chain
summary(TP)

## Diagnostic plots
par(mfrow = c(2, 2))
plot(TP)

## Generic plots from package coda
par(mfrow = c(1, 1))
densplot(TP)
traceplot(TP)
gelman.plot(TP)
autocorr.plot(TP)

## Use 'str()' to see the structure of object TP
str(TP)

## Every slot can be accessed using the '@' operator
TP@par          # input parameters
TP@model        # fitted model
TP@mcmc         # simulated TP, SE, SP
TP@diagnostics  # DIC and BGR (and bayesP)

## Each element of TP@mcmc inherits from coda class 'mcmc.list'
## List all available methods for this class
methods(class = "mcmc.list")
## List all available functions in the coda package
library(help = "coda")

## Highest Posterior Density interval, from coda package
HPDinterval(TP@mcmc$TP)



