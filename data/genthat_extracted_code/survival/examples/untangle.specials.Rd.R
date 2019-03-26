library(survival)


### Name: untangle.specials
### Title: Help Process the 'specials' Argument of the 'terms' Function.
### Aliases: untangle.specials
### Keywords: survival

### ** Examples

formula<-Surv(tt,ss)~x+z*strata(id)
tms<-terms(formula,specials="strata")
## the specials attribute
attr(tms,"specials")
## main effects 
untangle.specials(tms,"strata")
## and interactions
untangle.specials(tms,"strata",order=1:2)



