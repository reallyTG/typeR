library(languageR)


### Name: plotLMER.fnc
### Title: plot a mer object
### Aliases: plotLMER.fnc
### Keywords: regression

### ** Examples

  ## Not run: 
##D 
##D ###########################################################################
##D # we will stay as close to the older optimizer of lme4 as possible -
##D # this requires the optimx package and using the control option of lmer()
##D ###########################################################################
##D require(optimx)
##D 
##D ###########################################################################
##D # fitting a cosine with a spline (simulated data)
##D ###########################################################################
##D 
##D require("rms", quietly=TRUE, character=TRUE)
##D require("lme4", quietly=TRUE, character=TRUE)
##D dfr = makeSplineData.fnc()
##D table(dfr$Subject)
##D xylowess.fnc(Y ~ X | Subject, data = dfr)
##D # the smoother doesn't recognize the cosine function implemented in makeSplineData.fnc()
##D dev.off()   
##D 
##D dfr.lmer = lmer(Y ~ rcs(X, 5) + (1|Subject), data = dfr,
##D   control = lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D plotLMER.fnc(dfr.lmer)
##D 
##D # comparison with ols from Design package
##D dfr.lm = lm(Y~Subject+rcs(X), data=dfr, x=T, y=T)
##D dfr$fittedOLS = fitted(dfr.lm)
##D dfr$fittedLMER = as.vector(dfr.lmer@pp$X %*% fixef(dfr.lmer))
##D 
##D # we plot the lmer() fit in blue, the ols() fit in red (both adjusted for
##D # subject S1), and plot the underlying model in green
##D 
##D plot(dfr[dfr$Subject=="S1",]$X, 
##D   dfr[dfr$Subject=="S1",]$fittedLMER + ranef(dfr.lmer)[[1]]["S1",], 
##D   col="blue", ylim = c(24,30), xlab="X", ylab="Y", type="n")   
##D 
##D lines(dfr[dfr$Subject=="S1",]$X, dfr[dfr$Subject=="S1",]$fittedOLS, col="red")
##D lines(dfr[dfr$Subject=="S1",]$X, dfr[dfr$Subject=="S1",]$fittedLMER, col="blue")
##D lines(dfr[dfr$Subject=="S1",]$X, dfr[dfr$Subject=="S1",]$y+
##D   ranef(dfr.lmer)[[1]]["S1",], col="green")
##D legend(2,30,c("30+cos(x)", "lmer (S1)", "ols (S1)"), lty=rep(1,3), 
##D   col=c("green", "blue", "red"))
##D 
##D 
##D #############################################################
##D # a model with a raw polynomial
##D #############################################################
##D 
##D bg.lmer = lmer(LogRT ~ PC1+PC2+PC3 + ReadingScore +
##D   poly(OrthLength, 2, raw=TRUE) + LogFrequency + LogFamilySize +
##D   (1|Word) + (1|Subject)+(0+OrthLength|Subject) +
##D   (0+LogFrequency|Subject), data = beginningReaders,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D 
##D pars = par()
##D par(mfrow=c(3,3), mar=c(5,5,1,1))
##D plotLMER.fnc(bg.lmer, fun=exp, ylabel = "RT (ms)")
##D 
##D #############################################################
##D # a model with an interaction involving numeric predictors
##D #############################################################
##D 
##D danish.lmer = lmer(LogRT ~ PC1 + PC2 + PrevError + Rank +
##D   ResidSemRating + ResidFamSize + LogWordFreq*LogAffixFreq*Sex +  
##D   poly(LogCUP, 2, raw=TRUE) + LogUP + LogCUPtoEnd + 
##D   (1|Subject) + (1|Word) + (1|Affix), data = danish,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D danish.lmerA = lmer(LogRT ~ PC1 + PC2 + PrevError + Rank +
##D   ResidSemRating + ResidFamSize + LogWordFreq*LogAffixFreq*Sex +  
##D   poly(LogCUP, 2, raw=TRUE) + LogUP + LogCUPtoEnd + 
##D   (1|Subject) + (1|Word) + (1|Affix), data = danish,
##D   subset=abs(scale(resid(danish.lmer)))<2.5,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D 
##D # plot for reference level of Sex
##D plotLMER.fnc(danish.lmerA, pred = "LogAffixFreq", 
##D   intr=list("LogWordFreq", round(quantile(danish$LogWordFreq),3), "beg",
##D   list(c("red", "green", "blue", "yellow", "purple"), rep(1,5))), 
##D   ylimit=c(6.5,7.0))
##D 
##D # this model has a significant three-way interaction
##D # for visualization, we can either relevel Sex and refit,
##D # or make use of the control option. First releveling:
##D 
##D danish$Sex=relevel(danish$Sex, "F")
##D danish.lmerF = lmer(LogRT ~ PC1 + PC2 + PrevError + Rank +
##D   ResidSemRating + ResidFamSize + LogWordFreq*LogAffixFreq*Sex +  
##D   poly(LogCUP, 2, raw=TRUE) + LogUP + LogCUPtoEnd + 
##D   (1|Subject) + (1|Word) + (1|Affix), data = danish,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D danish$Sex=relevel(danish$Sex, "M")
##D danish.lmerM = lmer(LogRT ~ PC1 + PC2 + PrevError + Rank +
##D   ResidSemRating + ResidFamSize + LogWordFreq*LogAffixFreq*Sex +  
##D   poly(LogCUP, 2, raw=TRUE) + LogUP + LogCUPtoEnd + 
##D   (1|Subject) + (1|Word) + (1|Affix), data = danish,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D 
##D # Next preparing for using the control option:
##D #
##D # names(fixef(danish.lmer))[10]     # SexM
##D # unique(danish.lmer@pp$X[,10])     # 1 0
##D 
##D par(mfrow=c(2,2))
##D 
##D plotLMER.fnc(danish.lmer, pred="LogWordFreq", ylimit=c(6.5,7.0),
##D intr=list("LogAffixFreq", round(quantile(danish$LogAffixFreq),2), "end"),
##D control=list("SexM", 0))
##D mtext("females", line=1.5, cex=0.9)
##D 
##D plotLMER.fnc(danish.lmer, pred="LogWordFreq", ylimit=c(6.5,7.0),
##D intr=list("LogAffixFreq", round(quantile(danish$LogAffixFreq),2), "end"),
##D control=list("SexM", 1))
##D mtext("males", line=1.5, cex=0.9)
##D 
##D plotLMER.fnc(danish.lmerF, pred="LogWordFreq", ylimit=c(6.5,7.0), 
##D intr=list("LogAffixFreq", round(quantile(danish$LogAffixFreq),2), "end"))
##D mtext("females", line=1.5, cex=0.9)
##D 
##D plotLMER.fnc(danish.lmerM, pred="LogWordFreq", ylimit=c(6.5, 7.0),
##D intr=list("LogAffixFreq", round(quantile(danish$LogAffixFreq),2), "end"))
##D mtext("males", line=1.5, cex=0.9)
##D 
##D par(mfrow=c(1,1))
##D 
##D #############################################################
##D # calculating effect sizes, defined as max - min
##D #############################################################
##D 
##D # effect size for a covariate
##D 
##D dfr = plotLMER.fnc(danish.lmerA, pred = "LogCUP", withList=TRUE)
##D max(dfr$LogCUP$Y)-min(dfr$LogCUP$Y)
##D 
##D # effect size for a factor
##D 
##D dfr = plotLMER.fnc(danish.lmerA, pred = "PrevError", withList=TRUE)
##D max(dfr$PrevError$Y)-min(dfr$PrevError$Y)
##D 
##D 
##D # effect sizes for the quantiles in an interaction plot
##D 
##D dfr = plotLMER.fnc(danish.lmerA, pred = "LogAffixFreq", 
##D   withList=TRUE,
##D   intr=list("LogWordFreq", round(quantile(danish$LogWordFreq),3), "beg"))
##D 
##D unlist(lapply(dfr$LogAffixFreq, FUN=function(X)return(max(X$Y)-min(X$Y))))
##D 
##D 
##D #############################################################
##D # plotting an interaction between two factors
##D #############################################################
##D 
##D danish$WordFreqFac = danish$LogWordFreq > median(danish$LogWordFreq)
##D danish.lmer2 = lmer(LogRT ~ WordFreqFac*Sex +  
##D   (1|Subject) + (1|Word) + (1|Affix), data = danish,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D 
##D plotLMER.fnc(danish.lmer2, pred = "Sex", 
##D   intr=list("WordFreqFac", c("TRUE", "FALSE"), "end", 
##D   list(c("red",  "blue"), rep(1,2))),
##D   ylimit=c(6.7,6.9), cexsize=1.0, addlines=TRUE)
##D 
##D #############################################################
##D # a generalized linear mixed-effects model
##D #############################################################
##D 
##D dative.lmer = glmer(RealizationOfRecipient ~ 
##D   AccessOfTheme + AccessOfRec + LengthOfRecipient + AnimacyOfRec +
##D   AnimacyOfTheme + PronomOfTheme + DefinOfTheme + LengthOfTheme +
##D   SemanticClass + Modality + (1|Verb), 
##D   data = dative, family = "binomial",
##D   control=glmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D 
##D par(mfrow=c(3,4),mar=c(5,5,1,1))
##D plotLMER.fnc(dative.lmer, fun=plogis, addlines=TRUE)
##D 
##D # with user-specified labels for the x-axis
##D par(mfrow=c(3,4),mar=c(5,5,1,1))
##D plotLMER.fnc(dative.lmer, fun=plogis, addlines=TRUE,
##D   xlabs=unlist(strsplit("abcdefghij","")))
##D 
##D par(pars)
##D 
##D 
##D   
## End(Not run)



