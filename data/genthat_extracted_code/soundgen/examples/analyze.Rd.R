library(soundgen)


### Name: analyze
### Title: Analyze sound
### Aliases: analyze

### ** Examples

sound = soundgen(sylLen = 300, pitch = c(900, 400, 2300),
  noise = list(time = c(0, 300), value = c(-40, 00)),
  temperature = 0.001, addSilence = 0)
# playme(sound, 16000)
a = analyze(sound, samplingRate = 16000, plot = TRUE)

## Not run: 
##D sound1 = soundgen(sylLen = 900, pitch = list(
##D   time = c(0, .3, .9, 1), value = c(300, 900, 400, 2300)),
##D   noise = list(time = c(0, 300), value = c(-40, 00)),
##D   temperature = 0.001, addSilence = 0)
##D # improve the quality of postprocessing:
##D a1 = analyze(sound1, samplingRate = 16000, plot = TRUE, pathfinding = 'slow')
##D median(a1$pitch, na.rm = TRUE)
##D # (can vary, since postprocessing is stochastic)
##D # compare to the true value:
##D median(getSmoothContour(anchors = list(time = c(0, .3, .8, 1),
##D   value = c(300, 900, 400, 2300)), len = 1000))
##D 
##D # the same pitch contour, but harder b/c of subharmonics and jitter
##D sound2 = soundgen(sylLen = 900, pitch = list(
##D   time = c(0, .3, .8, 1), value = c(300, 900, 400, 2300)),
##D   noise = list(time = c(0, 900), value = c(-40, 20)),
##D   subDep = 100, jitterDep = 0.5, nonlinBalance = 100, temperature = 0.001)
##D # playme(sound2, 16000)
##D a2 = analyze(sound2, samplingRate = 16000, plot = TRUE, pathfinding = 'slow')
##D # many candidates are off, but the overall contour should be mostly accurate
##D 
##D # Fancy plotting options:
##D a = analyze(sound2, samplingRate = 16000, plot = TRUE,
##D   xlab = 'Time, ms', colorTheme = 'seewave',
##D   contrast = .5, ylim = c(0, 4),
##D   pitchMethods = c('dom', 'autocor', 'spec'),
##D   candPlot = list(
##D     col = c('gray70', 'yellow', 'purple'),  # same order as pitchMethods
##D     pch = c(1, 3, 5),
##D     cex = 3),
##D   pitchPlot = list(col = 'black', lty = 3, lwd = 3))
##D 
##D # Plot pitch candidates w/o a spectrogram
##D a = analyze(sound2, samplingRate = 16000, plot = TRUE, plotSpec = FALSE)
##D 
##D # Different formatting options for output
##D a = analyze(sound2, samplingRate = 16000, summary = FALSE)  # frame-by-frame
##D a = analyze(sound2, samplingRate = 16000, summary = TRUE,
##D             summaryStats = c('mean', 'range'))  # one row per sound
##D 
##D # Save the plot
##D a = analyze(sound, samplingRate = 16000,
##D             savePath = '~/Downloads/',
##D             width = 20, height = 15, units = 'cm', res = 300)
## End(Not run)



