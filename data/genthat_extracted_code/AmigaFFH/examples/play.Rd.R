library(AmigaFFH)


### Name: play
### Title: Playing Amiga audio data
### Aliases: play play,ANY-method play play,IFFChunk-method

### ** Examples

## Not run: 
##D ## First get an audio sample from the ProTrackR package
##D snare.samp <- ProTrackR::PTSample(ProTrackR::mod.intro, 2)
##D 
##D ## Coerce it into an IFFChunk object:
##D snare.iff <- WaveToIFF(snare.samp)
##D 
##D ## Play the 8SVX sample:
##D play(snare.iff)
## End(Not run)



