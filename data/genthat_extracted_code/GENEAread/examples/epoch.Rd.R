library(GENEAread)


### Name: epoch
### Title: Compute epochal summary statistics.
### Aliases: epoch apply.epoch

### ** Examples

## Not run: 
##D dat <- read.bin(system.file("binfile/TESTfile.bin", package = "GENEAread")[1]
##D , calibrate = TRUE)
##D 
##D #look for the epochs that exceed a certain threshold 50% of the time
##D plot(apply.epoch( dat, epoch.size = 3 ,
##D                   FUN = function(t) mean(abs(svm(t) -1)>0.2)> 0.5 ), type = "l")
##D 
##D plot(dat[,1], svm(dat), log = "y", pch = ".")
##D lines(mean.epoch(dat, incl.date = TRUE), lwd = 2)
##D lines(mean.epoch(dat, epoch.size = 30, incl.date = TRUE), col = 2, lwd = 2)
##D # This should give all the same results, but by a different way
##D lines(apply.epoch(dat, epoch.size = 30,
##D                   FUN = function(A) mean(svm(A, FALSE)), incl.date = TRUE), col = 3)
##D epsize = 30
##D lines(apply.epoch(dat, epoch.size = epsize,
##D                   FUN = function(t) median(t[,1])),
##D                   apply.epoch(dat, epoch.size = epsize,
##D                   FUN = function(A) mean(svm(A, FALSE))), col = 4)
##D #note this is different
##D lines(apply.epoch(dat, epoch.size = epsize,
##D                   FUN = function(t) median(t[,1])),
##D                   apply.epoch(dat, epoch.size = epsize,
##D                               FUN = function(A) mean(svm(A, sqrt = TRUE)))^2,
##D                               col = 5)
##D 
##D #plot some statistics
##D par(mfrow = c(5,1), mar = c(1,4.5,1,1))
##D plot(sd.epoch(dat), type="l")
##D plot(median.epoch(dat), type= "l")
##D plot(mad.epoch(dat), type= "l")
##D plot(autocor.epoch(dat), type= "l")
##D tmp = quantile.epoch(dat, quantiles= c(0.1, 0.25, 0.5, 0.75, 0.9)); matplot(tmp, type = "l")
## End(Not run)



