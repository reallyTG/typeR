library(eha)


### Name: risksets
### Title: Finds the compositions and sizes of risk sets
### Aliases: risksets
### Keywords: survival

### ** Examples


 enter <- c(0, 1, 0, 0)
 exit <- c(1, 2, 3, 4)
 event <- c(1, 1, 1, 0)
 risksets(Surv(enter, exit, event))




