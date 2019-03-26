library(Publish)


### Name: parseInteractionTerms
### Title: Parse interaction terms
### Aliases: parseInteractionTerms

### ** Examples


tt <- terms(formula(SBP~age+sex*BMI))
xlev <- list(sex=c("male","female"),BMI=c("normal","overweight","obese"))
parseInteractionTerms(terms=tt,xlevels=xlev)
parseInteractionTerms(terms=tt,xlevels=xlev,format.factor="var level")
parseInteractionTerms(terms=tt,xlevels=xlev,format.contrast="var(level:ref)")

tt2 <- terms(formula(SBP~age*factor(sex)+BMI))
xlev2 <- list("factor(sex)"=c("male","female"))
parseInteractionTerms(terms=tt2,xlevels=xlev2)
parseInteractionTerms(terms=tt2,xlevels=xlev2,units=list(age="yrs"))


data(Diabetes)
fit <- glm(bp.2s~age*factor(gender)+BMI,data=Diabetes)
parseInteractionTerms(terms=terms(fit$formula),xlevels=fit$xlevels,
                      format.scale="var -- level:ref",units=list("age"='years'))
parseInteractionTerms(terms=terms(fit$formula),xlevels=fit$xlevels,
                      format.scale.unit="var -- level:ref",units=list("age"='years'))
it <- parseInteractionTerms(terms=terms(fit$formula),xlevels=fit$xlevels)
ivars <- unlist(lapply(it,function(x)attr(x,"variables")))
lava::estimate(fit,function(p)lapply(unlist(it),eval,envir=sys.parent(-1)))





