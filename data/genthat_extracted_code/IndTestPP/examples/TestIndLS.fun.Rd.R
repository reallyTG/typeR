library(IndTestPP)


### Name: TestIndLS.fun
### Title: Calculate a Lotwick-Silverman test to check the independence
###   between up to three homogeneous point processes in time
### Aliases: TestIndLS.fun fn2B

### ** Examples


#Test applied to three independent NHPP
posx<-simHPc.fun(0.1, 20, fixed.seed=123)$posH
posz<-simHPc.fun(0.15,22, fixed.seed=124)$posH
posy<-simHPc.fun(0.1, 18, fixed.seed=125)$posH
T<-max(posx,posy,posz)+10

aux<-TestIndLS.fun(posx, posy, posz,T=T,
	cores=1,fixed.seed=321)
aux$KSpv




