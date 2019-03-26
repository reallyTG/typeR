library(languageR)


### Name: durationsGe
### Title: Durational measurements on the Dutch prefix ge-
### Aliases: durationsGe
### Keywords: datasets

### ** Examples

	## Not run: 
##D     data(durationsGe)
##D     durationsGe$Frequency = log(durationsGe$Frequency + 1)
##D     durationsGe$YearOfBirth = durationsGe$YearOfBirth - 1900
##D 
##D     durationsGe.lm = lm(DurationOfPrefix ~ Frequency+SpeechRate, data = durationsGe)
##D     summary(durationsGe.lm)
##D 
##D     # ---- model criticism
##D     
##D     plot(durationsGe.lm)
##D     outliers = c(271, 392, 256, 413, 118, 256)
##D     durationsGe.lm = lm(DurationOfPrefix ~ Frequency + SpeechRate, 
##D       data = durationsGe[-outliers, ])
##D     summary(durationsGe.lm)
##D   
## End(Not run)




