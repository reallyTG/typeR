library(mixor)


### Name: norcag
### Title: Attitudes Towards Sex Data from the 1989 General Social Survey
### Aliases: norcag
### Keywords: datasets

### ** Examples

library("mixor")
data("norcag")
# random intercepts model assuming proportional odds for differences in item responses
Fitted.norcag<-mixor(SexItems~Item2vs1+Item3vs1, data=norcag, id=ID, 
     weights=freq, link="logit", nAGQ=20)
summary(Fitted.norcag)
# random intercepts model assuming non-proportional odds for differences in item responses
Fitted.norcag.np<-mixor(SexItems~Item2vs1+Item3vs1, data=norcag, id=ID, 
     weights=freq, link="logit", nAGQ=10, KG=2)
summary(Fitted.norcag.np)
# SCALING model 
Fitted.norcag.scale<-mixor(SexItems~Item2vs1+Item3vs1, data=norcag, id=ID, 
     weights=freq, link="logit", nAGQ=10, KS=2)
summary(Fitted.norcag.scale)



