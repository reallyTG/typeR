library(chipPCR)


### Name: smoother
### Title: Wrapper for Several Smoothers of Amplification Data
### Aliases: smoother smoother.numeric smoother.matrix smoother.data.frame
###   smoother,numeric,numeric-method smoother,matrix,missing-method
###   smoother,data.frame,missing-method
### Keywords: smooth spline Friedman Savitzky-Golay methods

### ** Examples

# Results of different smoothers. A in-silico amplification was performed
# using the AmpSim function and different smoothers were applied. Optimally
# all smoothers should give the same result (which is not the case)).
# refMFI means referenced Mean Fluorescence Intensity 
# (Roediger et al. 2013)
tmp <- AmpSim(cyc = 1:35, bl = 0)

plot(tmp, main = "In-silico real-time PCR\n Effect of Smoother", 
     xlab = "Cycles", ylab ="refMFI", ylim = c(0,1), pch = 20, 
     type = "b", lwd = 2)

legend(25, 0.8, c("Raw data", "savgol", "lowess", "mova 3", "mova 5", 
		  "smooth", "spline", "supsmu"), pch = 20, lwd = 2, 
		  col = c(1:8))

## Not run: 
##D #on machines with multiple cores
##D library(parallel)
##D cl <- makeCluster(getOption("cl.cores", 2))
##D tmp.smooths <- smoother(tmp, method = list("savgol",
##D                                            "lowess",
##D                                            mova = list(movaww = 3),
##D                                            mova = list(movaww = 5),
##D                                            "smooth",
##D                                            "spline",
##D                                            "supsmu"),
##D                         parallel = TRUE)
##D stopCluster(cl)
## End(Not run)
#else
tmp.smooths <- smoother(tmp, method = list("savgol",
                                           "lowess",
                                           mova = list(movaww = 3),
                                           mova = list(movaww = 5),
                                           "smooth",
                                           "spline",
                                           "supsmu"))
for (i in 1:ncol(tmp.smooths))
  lines(tmp[, 1], tmp.smooths[, i], type = "b", pch = 20, lwd = 2, col = i 
+ 1)


par(fig = c(0.15,0.6,0.45,0.99), new = TRUE)
plot(tmp, main = "", xlab = "Cycles", ylab ="refMFI", 
     pch = 20, xlim = c(14,20), ylim = c(0,0.45))

for (i in 1:ncol(tmp.smooths))
  lines(tmp[, 1], tmp.smooths[, i], type = "b", pch = 20, lwd = 2, col = i 
+ 1)


# Plot the difference of the smoothed / filtered data
# to the raw data against the cycles
# The largest error is in the transition phases between
# start and end of the detectable amplification process.
par(fig = c(0,1,0,0.65))
plot(NA, NA, type = "b", col = 2, pch = 20, xlim = c(1,35), 
      ylim = c(-0.1,0.1), xlab = "Cycle", 
      ylab = "delta refMFI (raw - smoothed)", 
     main = "Smoothed / Filtered data")

legend(1.5, 0.1, ncol = 2, c("savgol", "lowess", "mova 3", "mova 5", 
	"smooth", "spline", "supsmu"), pch = 20, lwd = 2, 
	col = c(2:8))

for (i in 1:ncol(tmp.smooths))
  lines(tmp[, 1], tmp[, 2] - tmp.smooths[, i], type = "b", pch = 20, lwd = 
2, col = i + 1)

par(fig = c(0,1,0.55,1), new = TRUE)

plot(tmp, type = "b", col = 1, pch = 20, xlab = "", ylab = "RFU", 
      main = "Raw data")

#different ways of using smoother
#1. single method
single.smooth <- smoother(tmp, method = list("mova"))
#single smooth, additional argument specified
single.smooth.add <- smoother(tmp, method = list(mova = list(movaww = 3)))
#3. more than one smoothing method, no additional arguments specified
double.smooth <- smoother(tmp, method = list("savgol", "mova"))
#4. more than one smoothing method, additional arguments specified
double.smooth.add <- smoother(tmp, method = list("savgol", mova = 
list(movaww = 3)))
#5. all smoothing methods, no additional arguments specified
all.smooth <- smoother(tmp, method = list("all"))



