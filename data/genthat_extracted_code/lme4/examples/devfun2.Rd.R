library(lme4)


### Name: devfun2
### Title: Deviance function defined in terms of standard
###   deviations/correlations
### Aliases: devfun2
### Keywords: utilities

### ** Examples

m1 <- lmer(Reaction~Days+(Days|Subject),sleepstudy)
dd <- devfun2(m1,useSc=TRUE)
pp <- attr(dd,"optimum")
## extract variance-covariance and residual std dev parameters
sigpars <- pp[grepl("^\\.sig",names(pp))]
all.equal(unname(dd(sigpars)),deviance(refitML(m1)))



