library(soundgen)


### Name: crossFade
### Title: Join two waveforms by cross-fading
### Aliases: crossFade

### ** Examples

sound1 = sin(1:100 / 9)
sound2 = sin(7:107 / 3)
plot(c(sound1, sound2), type = 'b')
# an ugly discontinuity at 100 that will make an audible click

sound = crossFade(sound1, sound2, crossLenPoints = 5)
plot(sound, type = 'b') # a nice, smooth transition
length(sound) # but note that cross-fading costs us ~60 points
#  because of trimming to zero crossings and then overlapping

## Not run: 
##D # Actual sounds, alternative shapes of fade-in/out
##D sound3 = soundgen(formants = 'a', pitch = 200,
##D                   addSilence = 0, attackLen = c(50, 0))
##D sound4 = soundgen(formants = 'u', pitch = 200,
##D                   addSilence = 0, attackLen = c(0, 50))
##D 
##D # simple concatenation (with a click)
##D playme(c(sound3, sound4), 16000)
##D 
##D # concatentation from zc to zc (no click, but a rough transition)
##D playme(crossFade(sound3, sound4, crossLen = 0), 16000)
##D 
##D # linear crossFade over 35 ms - brief, but smooth
##D playme(crossFade(sound3, sound4, crossLen = 35, samplingRate = 16000), 16000)
##D 
##D # s-shaped cross-fade over 300 ms (shortens the sound by ~300 ms)
##D playme(crossFade(sound3, sound4, samplingRate = 16000,
##D                  crossLen = 300, shape = 'cos'), 16000)
## End(Not run)



