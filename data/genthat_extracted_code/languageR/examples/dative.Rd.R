library(languageR)


### Name: dative
### Title: Dative Alternation
### Aliases: dative
### Keywords: datasets

### ** Examples

## Not run: 
##D data(dative)
##D 
##D # analysis with CART tree
##D 
##D library(rpart)
##D 
##D # ---- initial tree
##D 
##D dative.rp = rpart(RealizationOfRecipient ~ ., 
##D  data = dative[ ,-c(1, 3)]) # exclude the columns with subjects, verbs
##D plot(dative.rp, compress = TRUE, branch = 1, margin = 0.1)
##D text(dative.rp, use.n = TRUE, pretty = 0)
##D 
##D # ---- pruning the initial tree
##D 
##D plotcp(dative.rp)
##D dative.rp1 = prune(dative.rp, cp = 0.041)
##D plot(dative.rp1, compress = TRUE, branch = 1, margin = 0.1)
##D text(dative.rp1, use.n = TRUE, pretty = 0)
##D 
##D 
##D # analysis with logistic regression
##D 
##D # ---- logistic regression with the rms package
##D 
##D library(rms)
##D dative.dd = datadist(dative)
##D options(datadist = 'dative.dd')
##D dative.lrm = lrm(RealizationOfRecipient ~ 
##D   AccessOfTheme + AccessOfRec + LengthOfRecipient + AnimacyOfRec +
##D   AnimacyOfTheme + PronomOfTheme + DefinOfTheme + LengthOfTheme+
##D   SemanticClass + Modality, data = dative)
##D anova(dative.lrm)
##D plot(Predict(dative.lrm))
##D 
##D # ---- mixed-effects logistic regression with the lme4 package
##D 
##D require(lme4) 
##D require(lmerTest)
##D require(optimx)
##D 
##D dative.lmer = glmer(RealizationOfRecipient ~ AccessOfTheme +
##D   AccessOfRec + LengthOfRecipient + AnimacyOfRec + 
##D   AnimacyOfTheme + PronomOfTheme + DefinOfTheme + LengthOfTheme + 
##D   SemanticClass + Modality + (1|Verb), 
##D   control=glmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = dative, family = "binomial") 
##D 
##D summary(dative.lmer)
##D 
##D # multiple comparisons for Accessibility of Theme
##D require(multcomp)
##D par(mar=c(5,8,3,1))
##D AcOfTheme.glht <- glht(dative.lmer, linfct = mcp(AccessOfTheme = "Tukey"))
##D plot(AcOfTheme.glht)
##D abline(v=0)
##D summary(AcOfTheme.glht)
##D 
##D 
## End(Not run) 


