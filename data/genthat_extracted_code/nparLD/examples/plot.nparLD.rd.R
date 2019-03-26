library(nparLD)


### Name: plot.nparLD
### Title: Plot for nparLD
### Aliases: plot plot.nparLD
### Keywords: htest

### ** Examples


## Example with the "Panic disorder study I" data (LD-F1 design) ##
data(panic)
ex.f1.np<-nparLD(resp~time, data=panic, subject="subject", description=FALSE, 
order.warning=FALSE)
plot.nparLD(ex.f1.np)




