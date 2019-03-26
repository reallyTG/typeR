library(paleoTS)


### Name: fitSimple
### Title: Fit simple models of trait evolution
### Aliases: fitSimple
### Keywords: models ts

### ** Examples

	x<- sim.Stasis(ns=30, theta=10, omega=1)
	s1<- fitSimple(x, model="URW")
	s2<- fitSimple(x, model="Stasis")
	s3<- fitSimple(x, model="StrictStasis")
	compareModels(s1, s2, s3)



