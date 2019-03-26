library(AmigaFFH)


### Name: deltaFibonacciCompress
### Title: (De)compress 8-bit continuous signals.
### Aliases: deltaFibonacciCompress deltaFibonacciDecompress

### ** Examples

## Not run: 
##D ## Let's get an audio wave from the ProTrackR package, which we
##D ## can use in this example:
##D buzz     <- ProTrackR::PTSample(ProTrackR::mod.intro, 1)
##D 
##D ## Let's convert it into raw data, such that we can compress it:
##D buzz.raw <- adfExplorer::amigaIntToRaw(ProTrackR::waveform(buzz) - 128, 8, T)
##D 
##D ## Let's compress it:
##D buzz.compress <- deltaFibonacciCompress(buzz.raw)
##D 
##D ## Look the new data uses less memory:
##D length(buzz.compress)/length(buzz.raw)
##D 
##D ## The compression was lossy, which we can examine by decompressing the
##D ## sample again:
##D buzz.decompress <- deltaFibonacciDecompress(buzz.compress)
##D 
##D ## And turn the raw data into numeric data:
##D buzz.decompress <- adfExplorer::rawToAmigaInt(buzz.decompress, 8, T)
##D 
##D ## Plot the original wave in black, the decompressed wave in blue
##D ## and the error in red (difference between the original and decompressed
##D ## wave). The error is actually very small here.
##D plot(ProTrackR::waveform(buzz) - 128, type = "l")
##D lines(buzz.decompress, col = "blue")
##D buzz.error <- ProTrackR::waveform(buzz) - 128 - buzz.decompress
##D lines(buzz.error, col = "red")
##D 
##D ## this can also be visualised by plotting the orignal wave data against
##D ## the decompressed data (and observe a very good correlation):
##D plot(ProTrackR::waveform(buzz) - 128, buzz.decompress)
##D 
##D ## Let's do the same with a sample of a snare drum, which has larger
##D ## delta values:
##D snare.drum <- ProTrackR::PTSample(ProTrackR::mod.intro, 2)
##D 
##D ## Let's convert it into raw data, such that we can compress it:
##D snare.raw <- adfExplorer::amigaIntToRaw(ProTrackR::waveform(snare.drum) - 128, 8, T)
##D 
##D ## Let's compress it:
##D snare.compress <- deltaFibonacciCompress(snare.raw)
##D 
##D ## Decompress the sample:
##D snare.decompress <- deltaFibonacciDecompress(snare.compress)
##D 
##D ## And turn the raw data into numeric data:
##D snare.decompress <- adfExplorer::rawToAmigaInt(snare.decompress, 8, T)
##D 
##D ## Now if we make the same comparison as before, we note that the
##D ## error in the decompressed wave is much larger than in the previous
##D ## case (red line):
##D plot(ProTrackR::waveform(snare.drum) - 128, type = "l")
##D lines(snare.decompress, col = "blue")
##D snare.error <- ProTrackR::waveform(snare.drum) - 128 - snare.decompress
##D lines(snare.error, col = "red")
##D 
##D ## this can also be visualised by plotting the orignal wave data against
##D ## the decompressed data (and observe a nice but not perfect correlation):
##D plot(ProTrackR::waveform(snare.drum) - 128, snare.decompress)
## End(Not run)



