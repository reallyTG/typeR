library(paleoTS)


### Name: LRI
### Title: Log-Rate, Log-Interval (LRI) method of Gingerich
### Aliases: LRI
### Keywords: models ts

### ** Examples

	xFast<- sim.GRW(ns=20, ms=0.5, vs=0.2)   # fast evolution
	xSlow<- sim.Stasis(ns=20, theta=10, omega=0)   # strict stasis! rates are actually zero
	wFast<- LRI(xFast, draw=FALSE)
	wSlow<- LRI(xSlow, draw=FALSE)
	## LRI usually assigns faster generational rate to Strict Stasis!
	print(wFast[3],4)
	print(wSlow[3],4)



