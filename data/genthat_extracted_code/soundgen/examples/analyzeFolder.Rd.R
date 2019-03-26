library(soundgen)


### Name: analyzeFolder
### Title: Analyze folder
### Aliases: analyzeFolder

### ** Examples

## Not run: 
##D # download 260 sounds from Anikin & Persson (2017)
##D # http://cogsci.se/personal/results/
##D # 01_anikin-persson_2016_naturalistics-non-linguistic-vocalizations/260sounds_wav.zip
##D # unzip them into a folder, say '~/Downloads/temp'
##D myfolder = '~/Downloads/temp'  # 260 .wav files live here
##D s = analyzeFolder(myfolder, verbose = TRUE)  # ~ 15-30 minutes!
##D 
##D # Save spectrograms with pitch contours plus an html file for easy access
##D a = analyzeFolder('~/Downloads/temp', savePlots = TRUE,
##D   showLegend = TRUE,
##D   width = 20, height = 12,
##D   units = 'cm', res = 300)
##D 
##D # Check accuracy: import manually verified pitch values (our "key")
##D key = pitchManual  # a vector of 260 floats
##D trial = s$pitch_median
##D cor(key, trial, use = 'pairwise.complete.obs')
##D plot(log(key), log(trial))
##D abline(a=0, b=1, col='red')
## End(Not run)



