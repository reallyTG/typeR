library(pequod)


### Name: simpleSlope
### Title: Simple slopes analysis for Moderated regression
### Aliases: simpleSlope simpleSlope.default print.simpleSlope
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
	## simple slope for three way interaction
	
	library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)
    S_slopes<-simpleSlope(model3,pred="len",mod1="trks", mod2="sigs1")


## The function is currently defined as
function (object, pred, mod1, mod2, coded, ...) 
UseMethod("simpleSlope")



