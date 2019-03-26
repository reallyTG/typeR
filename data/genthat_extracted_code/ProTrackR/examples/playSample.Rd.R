library(ProTrackR)


### Name: playSample
### Title: Play audio samples
### Aliases: playSample playSample,PTSample-method
###   playSample,PTModule-method

### ** Examples

## Not run: 
##D data("mod.intro")
##D 
##D ## play all samples in mod.intro:
##D playSample(mod.intro, 0.2, loop = 0.5)
##D 
##D ## play a chromatic scale using sample number 3:
##D for (note in c("A-2", "A#2", "B-2", "C-3", "C#3",
##D                "D-3", "D#3", "E-3", "F-3", "F#3",
##D                "G-3", "G#3"))
##D {
##D   playSample(PTSample(mod.intro, 3), note = note, silence = 0.05, loop = 0.4)
##D }
##D 
##D ## play the sample at a rate based on a specific
##D ## video mode and finetune:
##D playSample(PTSample(mod.intro, 3), video = "NTSC", finetune = -5)
## End(Not run)




