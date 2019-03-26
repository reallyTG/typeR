library(languageR)


### Name: danish
### Title: Danish auditory lexical decision
### Aliases: danish
### Keywords: datasets

### ** Examples

## Not run: 
##D data(danish)
##D require(lme4)
##D require(lmerTest)
##D require(optimx)
##D 
##D # ---- mixed-effects regression with three random intercepts
##D 
##D danish.lmer = lmer(LogRT ~ PC1 + PC2 + PrevError + Rank +
##D   ResidSemRating + ResidFamSize + LogWordFreq*LogAffixFreq*Sex +  
##D   poly(LogCUP, 2, raw=TRUE) + LogUP + LogCUPtoEnd + 
##D   (1|Subject) + (1|Word) + (1|Affix), data = danish,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D  
##D danish.lmerA = lmer(LogRT ~ PC1 + PC2 + PrevError + Rank +
##D   ResidSemRating + ResidFamSize + LogWordFreq*LogAffixFreq*Sex +  
##D   poly(LogCUP, 2, raw=TRUE) + LogUP + LogCUPtoEnd + 
##D   (1|Subject) + (1|Word) + (1|Affix), data = danish,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   subset=abs(scale(resid(danish.lmer)))<2.5)
##D 
##D summary(danish.lmerA)
## End(Not run)



