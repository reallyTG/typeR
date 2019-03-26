library(abctools)


### Name: recalibrationABC
### Title: ABC inference with a recalibration adjustment
### Aliases: recalibrationABC

### ** Examples

  ## Not run: 
##D   data(musigma2)
##D   P <- data.frame(par.sim)
##D   S <- data.frame(stat.sim)
##D   out <- recalibrationABC(target=stat.obs, param=P, sumstat=S, tol=0.3)
##D   plot(rbind(out$sample.plain[1:500,], out$sample.recal[1:500,]),
##D   col=c(rep("red",500), rep("blue", 500)))
##D   ##Red shows plain ABC sample, blue shows recalibrated output
## End(Not run)



