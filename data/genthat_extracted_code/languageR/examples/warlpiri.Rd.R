library(languageR)


### Name: warlpiri
### Title: Ergative case marking in Warlpiri
### Aliases: warlpiri
### Keywords: datasets

### ** Examples
## Not run: 
##D data(warlpiri)
##D require(lme4)
##D require(lmerTest)
##D require(optimx)
##D warlpiri.lmer = glmer(CaseMarking ~ WordOrder * AgeGroup + 
##D   AnimacyOfSubject + (1|Text) + (1|Speaker), 
##D   control=glmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   family = "binomial", data = warlpiri)
##D summary(warlpiri.lmer)
## End(Not run)


