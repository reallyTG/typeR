library(qtlDesign)


### Name: Power calculations
### Title: Power, sample size, and detectable effect size calculations
### Aliases: powercalc detectable samplesize powercalc.bc detectable.bc
###   samplesize.bc powercalc.f2 detectable.f2 samplesize.f2 powercalc.ri
###   detectable.ri samplesize.ri
### Keywords: design

### ** Examples

powercalc("bc",100,5,sigma2=1,sel.frac=1,theta=0)
powercalc(cross="ri",n=30,effect=5,env.var=64,gen.var=25,bio.rep=6)
detectable("bc",100,sigma2=1)
detectable(cross="ri",n=30,env.var=64,gen.var=25,bio.rep=8)
samplesize(cross="f2",effect=c(5,0),env.var=64,gen.var=25)



