library(languageR)


### Name: beginningReaders
### Title: Visual lexical decision with beginning readers
### Aliases: beginningReaders
### Keywords: datasets

### ** Examples

## Not run: 
##D data(beginningReaders)
##D require(lme4)
##D require(optimx)
##D require(lmerTest)
##D 
##D beginningReaders.lmer = lmer(LogRT ~  PC1 + PC2 + PC3  + ReadingScore +
##D   OrthLength + I(OrthLength^2) + LogFrequency + LogFamilySize +
##D   (1|Word) + (1|Subject) + (0+LogFrequency|Subject) + 
##D   (0+OrthLength|Subject) + (0+PC1|Subject), 
##D   data = beginningReaders,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D summary(beginningReaders.lmer)
## End(Not run)



