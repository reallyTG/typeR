library(clampSeg)


### Name: deconvolveLocally
### Title: Local deconvolution
### Aliases: deconvolveLocally 'local deconvolution' 'Local deconvolution'
###   'Local Deconvolution' localDeconvolution
### Keywords: nonparametric

### ** Examples

## refinement of an initial fit of the gramicidin A recordings given by gramA
# the used filter
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4),
                        sr = 1e4)
# initial fit
# with given q to save computation time
# this q is specific to length of the data and the filter
fit <- stepDetection(gramA, q = 1.370737, filter = filter, startTime = 9)

deconvolution <- deconvolveLocally(fit, data = gramA, filter = filter, startTime = 9)
## No test: 
# return fit after each refinement
every <- deconvolveLocally(fit, data = gramA, filter = filter, startTime = 9,
                           output = "every")

deconvolutionEvery <- every[[3]]
attr(deconvolutionEvery, "noDeconvolution") <- attr(every, "noDeconvolution")
identical(deconvolution, deconvolutionEvery)

# identical to a direct idealisation by jules
identical(jules(gramA, q = 1.370737, filter = filter, startTime = 9),
          deconvolution)

# plot of the data as in (Pein et al., 2017, figure 2 middle panel)
time <- 9 + seq(along = gramA) / filter$sr # time points
plot(time, gramA, pch = ".", col = "grey30", ylim = c(20, 50),
     ylab = "Conductance in pS", xlab = "Time in s")
lines(deconvolution, col = "#FF0000", lwd = 3)

## zoom into a single event, (Pein et al., 2017, figure 2 lower left panel)
plot(time, gramA, pch = 16, col = "grey30", ylim = c(20, 50),
     xlim = c(10.40835, 10.4103), ylab = "Conductance in pS", xlab = "Time in s")

# relevant part of the deconvolution
cps <- deconvolution$leftEnd[8:9]
levels <- deconvolution$value[7:9]
t <- seq(cps[1] - 0.0009, cps[2] + 0.0023, 1e-6)

# deconvolution
lines(t, ifelse(t < cps[1], rep(levels[1], length(t)),
                ifelse(t < cps[2], rep(levels[2], length(t)),
                       rep(levels[3], length(t)))),
      col = "#FF0000", lwd = 3)

# deconvolution convolved with the filter
lines(t, levels[1] * (1 - filter$truncatedStepfun(t - cps[1])) + 
        levels[2] * (filter$truncatedStepfun(t - cps[1]) - 
                       filter$truncatedStepfun(t - cps[2])) + 
        levels[3] * filter$truncatedStepfun(t - cps[2]),
      col = "#770000", lwd = 3)

# fit prior to the deconvolution
# does not fit the recorded data points appropriately
cps <- fit$leftEnd[8:9]
levels <- fit$value[7:9]
t <- seq(cps[1] - 0.0009, cps[2] + 0.0023, 1e-6)

# fit
lines(t, ifelse(t < cps[1], rep(levels[1], length(t)),
                ifelse(t < cps[2], rep(levels[2], length(t)),
                       rep(levels[3], length(t)))),
      col = "blue", lwd = 3)

# fit convolved with the filter
lines(t, levels[1] * (1 - filter$truncatedStepfun(t - cps[1])) + 
        levels[2] * (filter$truncatedStepfun(t - cps[1]) - 
                       filter$truncatedStepfun(t - cps[2])) + 
        levels[3] * filter$truncatedStepfun(t - cps[2]),
      col = "darkblue", lwd = 3)


## zoom into a single jump
plot(time, gramA, pch = 16, col = "grey30", ylim = c(20, 50),
     xlim = c(9.6476, 9.6496), ylab = "Conductance in pS", xlab = "Time in s")

# relevant part of the deconvolution
cp <- deconvolution$leftEnd[2]
levels <- deconvolution$value[1:2]
t <- seq(cp - 0.0009, cp + 0.0023, 1e-6)

# deconvolution
lines(t, ifelse(t < cp, rep(levels[1], length(t)), rep(levels[2], length(t))),
      col = "#FF0000", lwd = 3)

# deconvolution convolved with the filter
lines(t, levels[1] * (1 - filter$stepfun(t - cp)) + levels[2] * filter$stepfun(t - cp),
      col = "#770000", lwd = 3)

# deconvolution with a wrong filter
# does not fit the recorded data points appropriately
wrongFilter <- lowpassFilter(type = "bessel",
                             param = list(pole = 6L, cutoff = 0.2),
                             sr = 1e4)
deconvolutionWrong <- deconvolveLocally(fit, data = gramA, filter = wrongFilter,
                                        startTime = 9)

# relevant part of the deconvolution
cp <- deconvolutionWrong$leftEnd[2]
levels <- deconvolutionWrong$value[1:2]
t <- seq(cp - 0.0012, cp + 0.0023, 1e-6)

# deconvolution
lines(t, ifelse(t < cp, rep(levels[1], length(t)), rep(levels[2], length(t))),
      col = "blue", lwd = 3)

# deconvolution convolved with the filter
lines(t, levels[1] * (1 - filter$stepfun(t - cp)) + levels[2] * filter$stepfun(t - cp),
      col = "darkblue", lwd = 3)


# with less regularisation of the correlation matrix
deconvolveLocally(fit, data = gramA, filter = filter, startTime = 9,
                  regularization = 0.5)

# with estimation of the level of long segments by the mean
# but requiring 30 observations for it
deconvolveLocally(fit, data = gramA, filter = filter, startTime = 9,
                  localEstimate = mean, thresholdLongSegment = 30)

# with one refinement step less, but with a larger grid
# progress of the deconvolution is reported
# potential warning for no deconvolution is suppressed
deconvolveLocally(fit, data = gramA, filter = filter, startTime = 9,
                  gridSize = c(1 / filter$sr, 1 / 10 / filter$sr),
                  windowFactorRefinement = 2, report = TRUE,
                  suppressWarningNoDeconvolution = TRUE)
## End(No test)


