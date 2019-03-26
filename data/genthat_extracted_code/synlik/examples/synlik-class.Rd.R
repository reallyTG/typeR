library(synlik)


### Name: synlik-class
### Title: 'synlik-class'
### Aliases: synlik synlik-class

### ** Examples

#### Create Object
ricker_sl <- synlik(simulator = rickerSimul,
                    summaries = rickerStats,
                    param = c( logR = 3.8, logSigma = log(0.3), logPhi = log(10) ),
                    extraArgs = list("nObs" = 50, "nBurn" = 50),
                    plotFun = function(input, ...) 
                                plot(drop(input), type = 'l', ylab = "Pop", xlab = "Time", ...)
)
 
# Simulate from the object
ricker_sl@data <- simulate(ricker_sl)
ricker_sl@extraArgs$obsData <- ricker_sl@data # Needed by WOOD2010 statistics

plot(ricker_sl)      



