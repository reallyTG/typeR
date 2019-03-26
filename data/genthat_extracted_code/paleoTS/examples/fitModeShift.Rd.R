library(paleoTS)


### Name: fitModeShift
### Title: Fit models in which start in Stasis, and then shift to a random
###   walk (or vice versa)
### Aliases: fitModeShift opt.joint.RW.Stasis opt.AD.RW.Stasis
###   opt.joint.Stasis.RW opt.AD.Stasis.RW logL.joint.URW.Stasis
###   logL.joint.GRW.Stasis logL.joint.Stasis.URW logL.joint.Stasis.GRW
### Keywords: models ts

### ** Examples

	x<- sim.GRW(ns=30)
	m.urw<- fitSimple(x, model="URW")
	m.cplx<- fitModeShift(x, order="Stasis-RW", rw.model="URW", method="Joint")
	compareModels(m.urw, m.cplx)



