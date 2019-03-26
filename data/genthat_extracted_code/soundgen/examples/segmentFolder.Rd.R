library(soundgen)


### Name: segmentFolder
### Title: Segment all files in a folder
### Aliases: segmentFolder

### ** Examples

## Not run: 
##D # Download 260 sounds from the supplements to Anikin & Persson (2017) at
##D # http://cogsci.se/publications.html
##D # unzip them into a folder, say '~/Downloads/temp'
##D myfolder = '~/Downloads/temp'  # 260 .wav files live here
##D s = segmentFolder(myfolder, verbose = TRUE, savePlot = TRUE)
##D 
##D # Check accuracy: import a manual count of syllables (our "key")
##D key = segmentManual  # a vector of 260 integers
##D trial = as.numeric(s$nBursts)
##D cor(key, trial, use = 'pairwise.complete.obs')
##D boxplot(trial ~ as.integer(key), xlab='key')
##D abline(a=0, b=1, col='red')
## End(Not run)



