library(pompom)


### Name: iRAM
### Title: Generate iRAM (impulse response anlaysis metric) from model fit.
### Aliases: iRAM

### ** Examples

## Don't show: 
boot.iRAM <- iRAM(model.fit = usemmodelfit,
    beta = NULL,
    var.number = 3,
    lag.order = 1,
    threshold = 0.01,
    boot = TRUE,
    replication = 50, # default replication is 200, reduced to 50 to shorten running time
    steps = 30 # default steps is 100, reduced to 30 to shorten running time
    )
boot.iRAM$mean
## End(Don't show)
## No test: 
boot.iRAM <- iRAM(model.fit = usemmodelfit,
    beta = NULL,
    var.number = 3,
    lag.order = 1,
    threshold = 0.01,
    boot = TRUE,
    replication = 200,
    steps = 100
    )
boot.iRAM$mean
## End(No test)





