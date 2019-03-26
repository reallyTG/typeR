library(pequod)


### Name: summary.simpleSlope
### Title: summary for simpleSlope object
### Aliases: summary.simpleSlope print.summary.simpleSlope
### Keywords: ~kwd1 ~kwd2

### ** Examples


library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)
    S_slopes<-simpleSlope(model3,pred="len",mod1="trks", mod2="sigs1")
   summary(S_slopes)

## The function is currently defined as
function (object,...) 




