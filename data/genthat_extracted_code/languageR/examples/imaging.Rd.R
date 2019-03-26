library(languageR)


### Name: imaging
### Title: fMRI Filtered Signal and Priming Scores for Brain-Damaged
###   Patients
### Aliases: imaging
### Keywords: datasets

### ** Examples
## Not run: 
##D data(imaging)
##D 
##D imaging.lm = lm(FilteredSignal~BehavioralScore*Condition, data=imaging)
##D summary(imaging.lm)
##D 
##D plot(imaging$BehavioralScore, imaging$FilteredSignal, type = "n", 
##D   xlim = c(-30, 40), ylim = c(0, 80))
##D semantics = imaging[imaging$Condition == "semantics",]
##D irregulars = imaging[imaging$Condition == "irregulars",]
##D points(semantics$BehavioralScore, semantics$FilteredSignal, col = "black")
##D points(irregulars$BehavioralScore, irregulars$FilteredSignal, col = "darkgrey")
##D abline(lm(FilteredSignal ~ BehavioralScore, data = semantics), col = 'black')
##D abline(lm(FilteredSignal ~ BehavioralScore, data = irregulars), 
##D   col = 'darkgrey')
##D 
##D # model criticism
##D 
##D plot(imaging.lm)
##D outliers = c(1, 19) # given Cook's distance, or perhaps only
##D outliers = 1        # the outlier in the semantics subset
##D imaging.lm = lm(FilteredSignal ~ BehavioralScore * Condition, 
##D   data = imaging[-outliers, ])
##D summary(imaging.lm)
##D 
##D 
## End(Not run)


