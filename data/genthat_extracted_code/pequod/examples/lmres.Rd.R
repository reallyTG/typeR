library(pequod)


### Name: lmres
### Title: Moderated regression with residual centering
### Aliases: lmres lmres.default print.lmres
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
	## moderated regression with mean centering
	library(car)
	data(Ginzberg)
	model1<-lmres(adjdep~adjsimp*adjfatal, centered=c("adjsimp", "adjfatal"),
	data=Ginzberg)
	
	## moderated regression with mean centering
	library(car)
	data(Ginzberg)
	model1<-lmres(adjdep~adjsimp*adjfatal, centered=c("adjsimp", "adjfatal"),
	data=Ginzberg)
	## moderated regression with mean centering
	model2<-lmres(adjdep~adjsimp*adjfatal,residual_centering=TRUE,
	centered=c("adjsimp", "adjfatal"), data=Ginzberg)
	## three way interaction with mean centering
	library(car)
	data(Highway1)
	model3<-lmres(rate~len*trks*sigs1, centered=c("len","trks","sigs1"),data=Highway1)

## The function is currently defined as
function (formula, data, centered, ...) 
UseMethod("lmres")



