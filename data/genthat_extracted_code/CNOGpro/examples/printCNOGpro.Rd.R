library(CNOGpro)


### Name: printCNOGpro
### Title: Prints the results of a 'CNOGpro' experiment
### Aliases: printCNOGpro

### ** Examples

data(carsonella)
carsonella_normalized <- normalizeGC(carsonella)
carsonella_bootstrapped <- runBootstrap(carsonella_normalized, quantiles=c(0.01,0.99))
printCNOGpro(carsonella_bootstrapped)



