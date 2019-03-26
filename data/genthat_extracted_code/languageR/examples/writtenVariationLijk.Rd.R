library(languageR)


### Name: writtenVariationLijk
### Title: Variation in written Dutch in the use of the suffix -lijk
### Aliases: writtenVariationLijk
### Keywords: datasets

### ** Examples
## Not run: 
##D data(writtenVariationLijk)
##D 
##D require(lme4)
##D require(lmerTest)
##D require(lme4)
##D 
##D writtenVariationLijk.lmer = glmer(Count ~ Country * Register + (1|Word), 
##D   control=glmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = writtenVariationLijk, family = "poisson")
##D 
##D writtenVariationLijk.lmerA = glmer(Count ~ Country * Register + (Country|Word), 
##D   control=glmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = writtenVariationLijk, family = "poisson")
##D 
##D anova(writtenVariationLijk.lmer, writtenVariationLijk.lmerA)
##D 
##D summary(writtenVariationLijk.lmerA)
## End(Not run)


