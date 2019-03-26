library(languageR)


### Name: sizeRatings
### Title: Size ratings for 81 English concrete nouns
### Aliases: sizeRatings
### Keywords: datasets

### ** Examples
## Not run: 
##D data(sizeRatings)
##D require(lme4)
##D require(lmerTest)
##D require(optimx)
##D sizeRatings.lmer = lmer(Rating ~ Class * Naive + 
##D   MeanFamiliarity * Language + (1|Subject) + (1|Word), 
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = sizeRatings)
##D summary(sizeRatings.lmer)
## End(Not run)


