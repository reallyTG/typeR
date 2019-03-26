library(soundgen)


### Name: normalizeFolder
### Title: Normalize folder
### Aliases: normalizeFolder

### ** Examples

## Not run: 
##D # put a few short audio files in a folder, eg '~/Downloads/temp'
##D getRMSFolder('~/Downloads/temp', summaryFun = 'mean')  # different
##D normalizeFolder('~/Downloads/temp', type = 'rms', summaryFun = 'mean',
##D   savepath = '~/Downloads/temp/normalized')
##D getRMSFolder('~/Downloads/temp/normalized', summaryFun = 'mean')  # same
##D # If the saved audio files are treated as stereo with one channel missing,
##D # try reconverting with ffmpeg (saving is handled by tuneR::writeWave)
## End(Not run)



