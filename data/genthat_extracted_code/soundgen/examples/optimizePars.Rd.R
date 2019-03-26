library(soundgen)


### Name: optimizePars
### Title: Optimize parameters for acoustic analysis
### Aliases: optimizePars

### ** Examples

## Not run: 
##D # Download 260 sounds from the supplements in Anikin & Persson (2017)
##D # - see http://cogsci.se/publications.html
##D # Unzip them into a folder, say '~/Downloads/temp'
##D myfolder = '~/Downloads/temp'  # 260 .wav files live here
##D 
##D # Optimization of SEGMENTATION
##D # Import manual counts of syllables in 260 sounds from
##D # Anikin & Persson (2017) (our "key")
##D key = segmentManual  # a vector of 260 integers
##D 
##D # Run optimization loop several times with random initial values
##D # to check convergence
##D # NB: with 260 sounds and default settings, this might take ~20 min per iteration!
##D res = optimizePars(myfolder = myfolder, myfun = 'segmentFolder', key = key,
##D   pars = c('shortestSyl', 'shortestPause', 'sylThres'),
##D   fitnessPar = 'nBursts',
##D   nIter = 3, control = list(maxit = 50, reltol = .01, trace = 0))
##D 
##D # Examine the results
##D print(res)
##D for (c in 2:ncol(res)) {
##D   plot(res[, c], res[, 1], main = colnames(res)[c])
##D }
##D pars = as.list(res[1, 2:ncol(res)])  # top candidate (best pars)
##D s = do.call(segmentFolder, c(myfolder, pars))  # segment with best pars
##D cor(key, as.numeric(s[, fitnessPar]))
##D boxplot(as.numeric(s[, fitnessPar]) ~ as.integer(key), xlab='key')
##D abline(a=0, b=1, col='red')
##D 
##D # Try a grid with particular parameter values instead of formal optimization
##D res = optimizePars(myfolder = myfolder, myfun = 'segmentFolder', key = segment_manual,
##D   pars = c('shortestSyl', 'shortestPause'),
##D   fitnessPar = 'nBursts',
##D   mygrid = expand.grid(shortestSyl = c(30, 40),
##D                        shortestPause = c(30, 40, 50)))
##D 1 - res$fit  # correlations with key
##D 
##D # Optimization of PITCH TRACKING (takes several hours!)
##D res = optimizePars(myfolder = myfolder,
##D                    myfun = 'analyzeFolder',
##D                    key = log(pitchManual),  # log-scale better for pitch
##D                    pars = c('specThres', 'specSmooth'),
##D                    bounds = list(low = c(0, 0), high = c(1, Inf)),
##D                    fitnessPar = 'pitch_median',
##D                    nIter = 2,
##D                    otherPars = list(plot = FALSE, verbose = FALSE, step = 50,
##D                                     pitchMethods = 'spec'),
##D                    fitnessFun = function(x) {
##D                      1 - cor(log(x), key, use = 'pairwise.complete.obs') *
##D                        (1 - mean(is.na(x) & !is.na(key)))  # penalize failing to detect F0
##D                      })
## End(Not run)



