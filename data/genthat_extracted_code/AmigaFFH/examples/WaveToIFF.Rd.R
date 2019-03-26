library(AmigaFFH)


### Name: WaveToIFF
### Title: Convert WaveMC objects into an Interchange File Format object
### Aliases: WaveToIFF

### ** Examples

## Not run: 
##D ## First get an audio sample from the ProTrackR package
##D snare.samp <- ProTrackR::PTSample(ProTrackR::mod.intro, 2)
##D 
##D ## The sample can easily be converted into an IFFChunk:
##D snare.iff <- WaveToIFF(snare.samp)
##D 
##D ## You could also first convert the sample into a Wave object:
##D snare.wav <- as(snare.samp, "Wave")
##D 
##D ## And then convert into an IFFChunk. The result is the same:
##D snare.iff <- WaveToIFF(snare.wav)
##D 
##D ## You could also use a sine wave as input (although you will get some warnings).
##D ## This will work because the vector of numeric data can be coerced to
##D ## a WaveMC object
##D sine.iff <- WaveToIFF(sin((0:2000)/20))
## End(Not run)



