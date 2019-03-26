library(languageR)


### Name: plotlogistic.fit.fnc
### Title: Plot for goodness of fit of logistic regression
### Aliases: plotlogistic.fit.fnc
### Keywords: regression

### ** Examples
## Not run: 
##D data(dative)
##D require(lme4)
##D require(rms)
##D require(lmerTest)
##D require(optimx)
##D 
##D dative.lrm = lrm(RealizationOfRecipient ~ AccessOfTheme + 
##D    AccessOfRec + LengthOfRecipient + AnimacyOfRec +
##D    AnimacyOfTheme + PronomOfTheme + DefinOfTheme + LengthOfTheme +
##D    SemanticClass + Modality, 
##D    data = dative)
##D 
##D dative.glmm = glmer(RealizationOfRecipient ~ AccessOfTheme + 
##D    AccessOfRec + LengthOfRecipient + AnimacyOfRec +
##D    AnimacyOfTheme + PronomOfTheme + DefinOfTheme + LengthOfTheme +
##D    SemanticClass + Modality + (1|Verb), 
##D    control=glmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D    data = dative, family = "binomial")
##D 
##D par(mfrow=c(2,2))
##D plotlogistic.fit.fnc (dative.lrm, dative)
##D mtext("lrm", 3, 3)
##D plotlogistic.fit.fnc (dative.glmm, dative)
##D mtext("lmer", 3, 3)
##D plotlogistic.fit.fnc (dative.lrm, dative, scalesize=0.2)
##D mtext("lrm", 3, 3)
##D plotlogistic.fit.fnc (dative.glmm, dative, method="shingle")
##D mtext("lmer", 3, 3)
##D par(mfrow=c(1,1))
##D 
##D 
## End(Not run)


