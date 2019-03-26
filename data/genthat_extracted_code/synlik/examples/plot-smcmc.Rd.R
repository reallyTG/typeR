library(synlik)


### Name: plot-smcmc
### Title: Plotting objects of class 'smcmc'.
### Aliases: plot,smcmc,missing-method plot-smcmc

### ** Examples

data(ricker_smcmc)

# Functions for additional annotations (true parameters)
addline1 <- function(parNam, ...){ 
               abline(h = exp(ricker_smcmc@param[parNam]), lwd = 2, lty = 2, col = 3) 
               }
addline2 <- function(parNam, ...){ 
               abline(v = exp(ricker_smcmc@param[parNam]), lwd = 2, lty = 2, col = 3)
               }

# Transformations (exponentials)
trans <- rep("exp", 3)
names(trans) <- names(ricker_smcmc@param)

plot(ricker_smcmc, 
     trans = trans,
     addPlot1 = "addline1", 
     addPlot2 = "addline2")



