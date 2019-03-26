library(soundgen)


### Name: getLoudnessFolder
### Title: Loudness per folder
### Aliases: getLoudnessFolder

### ** Examples

## Not run: 
##D getLoudnessFolder('~/Downloads/temp')
##D # Compare:
##D analyzeFolder('~/Downloads/temp', pitchMethods = NULL,
##D               plot = FALSE)$loudness_mean
##D # (per STFT frame; should be very similar, but not identical, because
##D # analyze() discards frames considered silent or too noisy)
##D 
##D getLoudnessFolder('~/Downloads/temp', summaryFun = function(x) diff(range(x)))
##D 
##D # save loudness values per frame without summarizing
##D l = getLoudnessFolder('~/Downloads/temp', summary = FALSE)
## End(Not run)



