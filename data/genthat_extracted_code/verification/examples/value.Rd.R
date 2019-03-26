library(verification)


### Name: value
### Title: Forecast Value Function
### Aliases: value
### Keywords: file

### ** Examples

## value as a contingency table
## Finley tornado data
obs<- c(28, 72, 23, 2680) 
value(obs)
aa <- value(obs)
aa$Vmax # max value

## probabilistic forecast example
 obs  <- round(runif(100) )
 pred <-  runif(100)

value(obs, pred, main = "Sample Plot",
             thresholds = seq(0.02, 0.98, 0.02) ) 
##########
data(pop)
d <- pop.convert()

value(obs = d$obs_rain, pred = d$p24_rain, all = TRUE)

 


