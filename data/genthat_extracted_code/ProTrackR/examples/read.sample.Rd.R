library(ProTrackR)


### Name: read.sample
### Title: Read an audio file and coerce to a PTSample object
### Aliases: read.sample read.sample,character-method

### ** Examples

## Not run: 
##D data("mod.intro")
##D 
##D ## create an audio file which we can then read:
##D write.sample(PTSample(mod.intro, 2), "snaredrum.iff", "8svx")
##D 
##D ## read the created sample:
##D snare <- read.sample("snaredrum.iff", "8svx")
##D print(snare)
## End(Not run)




