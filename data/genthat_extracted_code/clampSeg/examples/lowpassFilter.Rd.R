library(clampSeg)


### Name: lowpassFilter
### Title: Lowpass filtering
### Aliases: lowpassFilter print.lowpassFilter
### Keywords: ts

### ** Examples

# the filter used for the gramicidin A recordings given by gramA
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4),
                        sr = 1e4)

# filter kernel, truncated version
plot(filter$kernfun, xlim = c(0, 20 / filter$sr))
t <- seq(0, 20 / filter$sr, 0.01 / filter$sr)
# truncated version looks very similar
lines(t, filter$truncatedKernfun(t), col = "red")

# filter$len (== 11) is chosen such that filter$acf < 1e-3 for it and all larger lags
plot(filter$acfun, xlim = c(0, 20 / filter$sr), ylim = c(-0.003, 0.003))
abline(h = 0.001, lty = "22")
abline(h = -0.001, lty = "22")

abline(v = (filter$len - 1L) / filter$sr, col = "grey")
abline(v = filter$len / filter$sr, col = "red")
## No test: 
## zoom into a single jump of the idealisation
## we suggest to do this for every new measurement setup once 
## to control whether the correct filter is assumed
# idealisation by JULES (might take some time if not called somewhere before,
# please see its documentation for more details)
idealisation <- jules(gramA, filter = filter, startTime = 9, messages = 100)

## zoom into a single jump
plot(9 + seq(along = gramA) / filter$sr, gramA, pch = 16, col = "grey30",
     ylim = c(20, 50), xlim = c(9.6476, 9.6496), ylab = "Conductance in pS",
     xlab = "Time in s")

# relevant part of the idealisation
cp <- idealisation$leftEnd[2]
levels <- idealisation$value[1:2]
t <- seq(cp - 0.0009, cp + 0.0023, 1e-6)

# idealisation
lines(t, ifelse(t < cp, rep(levels[1], length(t)), rep(levels[2], length(t))),
      col = "#FF0000", lwd = 3)

# idealisation convolved with the filter
lines(t, levels[1] * (1 - filter$stepfun(t - cp)) + levels[2] * filter$stepfun(t - cp),
      col = "#770000", lwd = 3)

# idealisation with a wrong filter
# does not fit the recorded data points appropriately
wrongFilter <- lowpassFilter(type = "bessel",
                             param = list(pole = 6L, cutoff = 0.2),
                             sr = 1e4)
# the needed Monte-Carlo simulation depends on the number of observations and the filter
# hence a new simulation is required (if called for the first time)
idealisationWrong <- jules(gramA, filter = wrongFilter, startTime = 9, messages = 100)

# relevant part of the idealisation
cp <- idealisationWrong$leftEnd[2]
levels <- idealisationWrong$value[1:2]
t <- seq(cp - 0.0012, cp + 0.0023, 1e-6)

# idealisation
lines(t, ifelse(t < cp, rep(levels[1], length(t)), rep(levels[2], length(t))),
      col = "blue", lwd = 3)

# idealisation convolved with the filter
lines(t, levels[1] * (1 - filter$stepfun(t - cp)) + levels[2] * filter$stepfun(t - cp),
      col = "darkblue", lwd = 3)
## End(No test)

# filter with sr == 1
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4))

# filter kernel and its truncated version
plot(filter$kernfun, xlim = c(0, 20 / filter$sr))
t <- seq(0, 20 / filter$sr, 0.01 / filter$sr)
# truncated version looks very similar
lines(t, filter$truncatedKernfun(t), col = "red")
# digitised filter
points((0:filter$len + 0.5) / filter$sr, filter$kern, col = "red", pch = 16)

# without a shift
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4),
                        shift = 0)
# filter$kern starts with zero
points(0:filter$len / filter$sr, filter$kern, col = "blue", pch = 16)

# much shorter filter
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4),
                        len = 4L)
points((0:filter$len + 0.5) / filter$sr, filter$kern, col = "darkgreen", pch = 16)



