library(soundgen)


### Name: matchPars
### Title: Match soundgen pars (experimental)
### Aliases: matchPars

### ** Examples

playback = c(TRUE, FALSE)[2]  # set to TRUE to play back the audio from examples

target = soundgen(repeatBout = 3, sylLen = 120, pauseLen = 70,
  pitch = c(300, 200), rolloff = -5, play = playback)
# we hope to reproduce this sound

## Not run: 
##D # Match pars based on acoustic analysis alone, without any optimization.
##D # This *MAY* match temporal structure, pitch, and stationary formants
##D m1 = matchPars(target = target,
##D                samplingRate = 16000,
##D                maxIter = 0,  # no optimization, only acoustic analysis
##D                verbose = playback)
##D cand1 = do.call(soundgen, c(m1$pars, list(play = playback, temperature = 0.001)))
##D 
##D # Try to improve the match by optimizing rolloff
##D # (this may take a few minutes to run, and the results may vary)
##D m2 = matchPars(target = target,
##D                samplingRate = 16000,
##D                pars = 'rolloff',
##D                maxIter = 100,
##D                verbose = playback)
##D # rolloff should be moving from default (-9) to target (-5):
##D sapply(m2$history, function(x) x$pars$rolloff)
##D cand2 = do.call(soundgen, c(m2$pars, list(play = playback, temperature = 0.001)))
## End(Not run)



