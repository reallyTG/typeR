library(dfped)


### Name: doseChoice
### Title: Choice of the next given dose level.
### Aliases: doseChoice

### ** Examples

r <- 0.10
q <- 0.17
p <- 0.9
targetTox <- 0.6 
givenDose <- 2
newDose <- doseChoice(r, q, p, targetTox, givenDose)   
newDose



