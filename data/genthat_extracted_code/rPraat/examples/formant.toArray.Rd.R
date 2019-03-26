library(rPraat)


### Name: formant.toArray
### Title: formant.toArray
### Aliases: formant.toArray

### ** Examples

formantArray <- formant.toArray(formant.sample())
formantArray$t[1:10]
formantArray$frequencyArray[, 1:10]
formantArray$bandwidthArray[, 1:10]
formantArray$intensityVector[1:10]
## Not run: 
##D plot(formantArray$t, formantArray$frequencyArray[1, ]) # draw 1st formant track
## End(Not run)



