library(paleoTS)


### Name: compareModels
### Title: Compare output from any set of model fits
### Aliases: compareModels
### Keywords: models ts

### ** Examples

	x<- sim.GRW(ns=40)
	m1<- fitSimple(x, model="URW")
	m2<- fitSimple(x, model="GRW")
	m3<- fitGpunc(x, ng=2, minb=10)
	compareModels(m1,m2,m3)



