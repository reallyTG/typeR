library(denoiSeq)


### Name: setInitValues
### Title: Generic for altering the initValues slot
### Aliases: setInitValues setInitValues,readsData-method

### ** Examples

RD <- new("readsData", counts = ERCC)
initvals <- list(N_A = rep(2, 92), N_B = rep(1.5, 92), p = 0.0005, f = 0.03)
RD <- setInitValues(RD, initvals)
RD@initValues



