library(sdcMicro)


### Name: print.indivRisk
### Title: Print method for objects from class indivRisk
### Aliases: print.indivRisk
### Keywords: print

### ** Examples


## example from Capobianchi, Polettini and Lucarelli:
data(francdat)
f1 <- freqCalc(francdat, keyVars=c(2,4,5,6),w=8)
data.frame(fk=f1$fk, Fk=f1$Fk)
## individual risk calculation:
indivRisk(f1)




