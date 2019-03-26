library(denoiSeq)


### Name: setStepSizes
### Title: Generic for altering the stepSizes slot.
### Aliases: setStepSizes setStepSizes,readsData-method

### ** Examples

RD <- new("readsData", counts = ERCC)
ss <- list(N_A = rep(2,  92), N_B = rep(1.5, 92), p = 3e5, f = 3.5e7)
RD <- setStepSizes(RD, ss)
RD@stepSizes



