library(soundgen)


### Name: ssm
### Title: Self-similarity matrix
### Aliases: ssm

### ** Examples

sound = c(soundgen(), soundgen(nSyl = 4, sylLen = 50, pauseLen = 70,
          formants = NA, pitchAnchors = c(500, 330)))
# playme(sound)
m1 = ssm(sound, samplingRate = 16000,
         input = 'audiogram', simil = 'cor', norm = FALSE,
         ssmWin = 10, kernelLen = 150)  # detailed, local features
## Not run: 
##D m2 = ssm(sound, samplingRate = 16000,
##D          input = 'mfcc', simil = 'cosine', norm = TRUE,
##D          ssmWin = 50, kernelLen = 600)  # more global
##D # plot(m2$novelty, type='b')  # use for peak detection, etc
## End(Not run)



