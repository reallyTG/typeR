library(languageR)


### Name: makeSplineData.fnc
### Title: generate simulated data set with nonlinear function
### Aliases: makeSplineData.fnc
### Keywords: regression

### ** Examples

## Not run: 
##D require("rms")
##D require("optimx")
##D require("lmerTest")
##D dfr = makeSplineData.fnc()
##D table(dfr$Subject)
##D xylowess.fnc(Y ~ X | Subject, data = dfr)
##D 
##D dfr.lmer = lmer(Y ~ rcs(X, 5) + (1|Subject), data = dfr,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D dfr$fittedLMER = as.vector(dfr.lmer@X %*% fixef(dfr.lmer))
##D 
##D dfr.dd = datadist(dfr)
##D options(datadist='dfr.dd')
##D dfr.ols = ols(Y~Subject+rcs(X), data=dfr, x=T, y=T)
##D dfr$fittedOLS = fitted(dfr.ols)
##D 
##D # we plot the lmer() fit in blue, the ols() fit in red (both adjusted for
##D # subject S1), and plot the underlying model in green
##D plot(dfr[dfr$Subject=="S1",]$X, dfr[dfr$Subject=="S1",]$fittedLMER +
##D   ranef(dfr.lmer)[[1]]["S1",], type="l", col="blue",
##D   ylim = range(dfr$y + ranef(dfr.lmer)[[1]]["S1",],
##D   dfr[dfr$Subject == "S1",]$fittedLMER,
##D   dfr[dfr$Subject == "S1",]$fittedOLS), xlab="X", ylab="Y")   
##D lines(dfr[dfr$Subject=="S1",]$X, dfr[dfr$Subject=="S1",]$fittedOLS, col="red")
##D lines(dfr[dfr$Subject=="S1",]$X, dfr[dfr$Subject=="S1",]$y+ranef(dfr.lmer)[[1]]["S1",], 
##D   col="green")
##D legend(2,29,c("30+cos(x)", "lmer (S1)", "ols (S1)"), lty=rep(1,3), 
##D col=c("green", "blue", "red"))
## End(Not run)



