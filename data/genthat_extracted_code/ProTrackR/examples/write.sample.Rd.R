library(ProTrackR)


### Name: write.sample
### Title: Write a PTSample object to an audio file
### Aliases: write.sample write.sample,PTSample,character-method

### ** Examples

## Not run: 
##D data("mod.intro")
##D 
##D ## Export the second sample of mod.intro as a wav file:
##D write.sample(PTSample(mod.intro, 2), "snaredrum.wav", "wav")
##D 
##D ## Export the second sample of mod.intro as an 8svx file:
##D write.sample(PTSample(mod.intro, 2), "snaredrum.iff", "8svx")
##D 
##D ## Export the second sample of mod.intro as a raw file:
##D write.sample(PTSample(mod.intro, 2), "snaredrum.raw", "raw")
## End(Not run)




