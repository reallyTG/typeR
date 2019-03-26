library(soundgen)


### Name: compareSounds
### Title: Compare sounds (experimental)
### Aliases: compareSounds

### ** Examples

## Not run: 
##D target = soundgen(sylLen = 500, formants = 'a',
##D                   pitch = data.frame(time = c(0, 0.1, 0.9, 1),
##D                                      value = c(100, 150, 135, 100)),
##D                   temperature = 0.001)
##D targetSpec = soundgen:::getMelSpec(target, samplingRate = 16000)
##D parsToTry = list(
##D   list(formants = 'i',                                            # wrong
##D        pitch = data.frame(time = c(0, 1),                         # wrong
##D                           value = c(200, 300))),
##D   list(formants = 'i',                                            # wrong
##D        pitch = data.frame(time = c(0, 0.1, 0.9, 1),               # right
##D                                  value = c(100, 150, 135, 100))),
##D   list(formants = 'a',                                            # right
##D        pitch = data.frame(time = c(0,1),                          # wrong
##D                                  value = c(200, 300))),
##D   list(formants = 'a',
##D        pitch = data.frame(time = c(0, 0.1, 0.9, 1),               # right
##D                                  value = c(100, 150, 135, 100)))  # right
##D )
##D 
##D sounds = list()
##D for (s in 1:length(parsToTry)) {
##D   sounds[[length(sounds) + 1]] =  do.call(soundgen,
##D     c(parsToTry[[s]], list(temperature = 0.001, sylLen = 500)))
##D }
##D 
##D method = c('cor', 'cosine', 'pixel', 'dtw')
##D df = matrix(NA, nrow = length(parsToTry), ncol = length(method))
##D colnames(df) = method
##D df = as.data.frame(df)
##D for (i in 1:nrow(df)) {
##D   df[i, ] = compareSounds(
##D     target = NULL,            # can use target instead of targetSpec...
##D     targetSpec = targetSpec,  # ...but faster to calculate targetSpec once
##D     cand = sounds[[i]],
##D     samplingRate = 16000,
##D     padWith = NA,
##D     penalizeLengthDif = TRUE,
##D     method = method,
##D     summary = FALSE
##D   )
##D }
##D df$av = rowMeans(df, na.rm = TRUE)
##D # row 1 = wrong pitch & formants, ..., row 4 = right pitch & formants
##D df$formants = c('wrong', 'wrong', 'right', 'right')
##D df$pitch = c('wrong', 'right', 'wrong', 'right')
##D df
## End(Not run)



