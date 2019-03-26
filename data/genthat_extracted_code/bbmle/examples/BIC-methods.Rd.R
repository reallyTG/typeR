library(bbmle)


### Name: BIC-methods
### Title: Log likelihoods and model selection for mle2 objects
### Aliases: BIC-methods AIC-methods AICc-methods logLik-methods AICc
###   AIC,mle2-method AICc,mle2-method AICc,logLik-method AICc,ANY-method
###   AICc,ANY,mle2,logLik-method qAICc qAICc-methods qAICc,ANY-method
###   qAICc,mle2-method qAICc,logLik-method qAIC qAIC-methods
###   qAIC,ANY-method qAIC,mle2-method qAIC,logLik-method
###   qAIC,ANY,mle2,logLik-method qAICc,ANY,mle2,logLik-method
###   logLik,mle2-method anova,mle2-method
### Keywords: methods

### ** Examples

  d <- data.frame(x=0:10,y=c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8))
  (fit <- mle2(y~dpois(lambda=ymax/(1+x/xhalf)),
      start=list(ymax=25,xhalf=3),data=d))
  (fit2 <- mle2(y~dpois(lambda=(x+1)*slope),
      start=list(slope=1),data=d))
  BIC(fit)
  BIC(fit,fit2)
  


