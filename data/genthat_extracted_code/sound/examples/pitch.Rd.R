library(sound)


### Name: pitch
### Title: Pitch a Sample Object
### Aliases: pitch
### Keywords: manip

### ** Examples
## Not run: 
##D s <- Sine(440,1)
##D # Now play it 12 semitones = 1 octave deeper,
##D # that is half the frequencies and twice the length,
##D # or played at half speed.
##D play(pitch(s,-12)) # is the same as...
##D play(Sine(220,2))
## End(Not run)


