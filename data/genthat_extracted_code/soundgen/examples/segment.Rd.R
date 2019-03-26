library(soundgen)


### Name: segment
### Title: Segment a sound
### Aliases: segment

### ** Examples

sound = soundgen(nSyl = 8, sylLen = 50, pauseLen = 70,
  pitch = c(368, 284), temperature = 0.1,
  noise = list(time = c(0, 67, 86, 186), value = c(-45, -47, -89, -120)),
  rolloff_noise = -8, amplAnchorsGlobal = c(0, -20))
spectrogram(sound, samplingRate = 16000, osc = TRUE)
 # playme(sound, samplingRate = 16000)

s = segment(sound, samplingRate = 16000, plot = TRUE)
# accept quicker and quieter syllables
s = segment(sound, samplingRate = 16000, plot = TRUE,
  shortestSyl = 25, shortestPause = 25, sylThres = .2, burstThres = .05)

# just a summary
segment(sound, samplingRate = 16000, summary = TRUE)

# customizing the plot
s = segment(sound, samplingRate = 16000, plot = TRUE,
            shortestSyl = 25, shortestPause = 25,
            sylThres = .2, burstThres = .05,
            col = 'black', lwd = .5,
            sylPlot = list(lty = 2, col = 'gray20'),
            burstPlot = list(pch = 16, col = 'gray80'),
            xlab = 'ms', cex.lab = 1.2, main = 'My awesome plot')

## Not run: 
##D # customize the resolution of saved plot
##D s = segment(sound, samplingRate = 16000, savePath = '~/Downloads/',
##D             width = 1920, height = 1080, units = 'px')
## End(Not run)



