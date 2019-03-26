### R code from vignette source 'Guide.Stex'

###################################################
### code chunk number 1: Guide.Stex:8-9
###################################################
 options(continue="  ")


###################################################
### code chunk number 2: Guide.Stex:12-13
###################################################
 options(continue="  ")


###################################################
### code chunk number 3: Guide.Stex:20-21
###################################################
library("EvalEst")


###################################################
### code chunk number 4: Guide.Stex:45-58
###################################################
mod1 <- ARMA(A=array(c(1,-.25,-.05), c(3,1,1)), 
             B=array(1,c(1,1,1)))

mod2 <- ARMA(A=array(c(1,-.8, -.2 ), c(3,1,1)), 
             B=array(1,c(1,1,1)))

mod3 <- ARMA(
 A=array(c( 
  1.00,-0.06,0.15,-0.03,0.00,0.02,0.03,-0.02,0.00,-0.02,-0.03,
  -0.02,0.00,-0.07,-0.05,0.12,1.00,0.20,-0.03,-0.11,0.00,-0.07,
  -0.03,0.08,0.00,-0.40,-0.05,-0.66,0.00,0.00,0.17,-0.18,1.00,
  -0.11,-0.24,-0.09), c(4,3,3)), 
 B=array(diag(1,3), c(1,3,3)))


###################################################
### code chunk number 5: Guide.Stex:66-72
###################################################
z <-  MonteCarloSimulations(mod1, 
                            simulation.args=list(sampleT=100))

tfplot(z)

distribution(z)


###################################################
### code chunk number 6: Guide.Stex:83-92
###################################################
e.ls.mod1 <- EstEval( mod1, replications=100,
  simulation.args=list(sampleT=100, sd=1),
  estimation="estVARXls",
  estimation.args=list(max.lag=2),
  criterion="TSmodel"
#  rng=list(kind="default", normal.kind="default", 
#  seed=c(13,44,1,25,56,0,6,33,22,13,13,0))# Splus - see below
 
  ) 


###################################################
### code chunk number 7: Guide.Stex:126-128
###################################################
rng=list(kind="Wichmann-Hill", seed=c(979,1479,1542),
 normal.kind="Box-Muller")


###################################################
### code chunk number 8: Guide.Stex:136-139
###################################################
library("setRNG")
setRNG(kind="Wichmann-Hill", seed=c(979,1479,1542),
 normal.kind="Box-Muller")


###################################################
### code chunk number 9: Guide.Stex:148-156
###################################################
e.ls.mod2 <- EstEval( mod2, replications=100, 
                  simulation.args=list(sampleT=100, sd=1), 
                  estimation="estVARXls", 
		  estimation.args=list(max.lag=2), 
                  criterion="TSmodel"
                  #rng=list(kind="default", normal.kind="default",
                  #seed=c(13,43,7,57,62,3,30,29,24,54,47,2))#Splus
 )


###################################################
### code chunk number 10: Guide.Stex:163-166
###################################################
par(mfcol=c(2,1)) # set the number of plots on the graphics device

tfplot(coef(e.ls.mod1)) 


###################################################
### code chunk number 11: Guide.Stex:171-172
###################################################
tfplot(coef(e.ls.mod2)) 


###################################################
### code chunk number 12: Guide.Stex:179-181
###################################################
par(mfcol = c(2,1)) #set number of plots on graphics device
tfplot(coef(e.ls.mod1), cumulate = FALSE, bounds = FALSE)


###################################################
### code chunk number 13: Guide.Stex:186-187
###################################################
tfplot(coef(e.ls.mod2), cumulate = FALSE, bounds = FALSE) 


###################################################
### code chunk number 14: Guide.Stex:192-193
###################################################
distribution(coef(e.ls.mod1), bandwidth=.2) 


###################################################
### code chunk number 15: Guide.Stex:198-199
###################################################
distribution(coef(e.ls.mod2), bandwidth=.2) 


###################################################
### code chunk number 16: Guide.Stex:205-210
###################################################
e.ls.mod1.roots <- roots(e.ls.mod1)
plot(e.ls.mod1.roots) 
plot(e.ls.mod1.roots, complex.plane=F) 
plot(roots(e.ls.mod2), complex.plane=F) 
distribution(e.ls.mod1.roots, bandwidth=.2) 


###################################################
### code chunk number 17: Guide.Stex:215-216
###################################################
distribution(roots(e.ls.mod2), bandwidth=.1) 


###################################################
### code chunk number 18: Guide.Stex:236-242
###################################################
pc <- forecastCovEstimatorsWRTtrue(mod3,
        estimation.methods = list(estVARXls=list(max.lag=6)),
        est.replications=2, pred.replications=10
       # rng=list(kind="default", normal.kind="default", 
       # seed=c( 53,41,26,39,10,1,19,25,56,32,28,3))#Splus
) 


###################################################
### code chunk number 19: Guide.Stex:262-268
###################################################
pc.rd <- forecastCovReductionsWRTtrue(mod3,
              estimation.methods = list(estVARXls=list(max.lag=3)),
              est.replications=2, pred.replications=10
              # rng = list(kind = "default", normal.kind="default", 
              # seed=c(29,55,47,18,33,1,15,15,34,46,13,2)) 
)


###################################################
### code chunk number 20: Guide.Stex:282-287
###################################################
data(eg1.DSE.data, package="dse")
z <-outOfSample.forecastCovEstimatorsWRTdata(trimNA(eg1.DSE.data),
estimation.sample=.5,
estimation.methods = list(estVARXar=NULL, estVARXls=NULL), 
trend=T)


###################################################
### code chunk number 21: Guide.Stex:292-293
###################################################
tfplot(z)


###################################################
### code chunk number 22: Guide.Stex:300-307
###################################################
z <-outOfSample.forecastCovEstimatorsWRTdata( trimNA(eg1.DSE.data),
                     estimation.sample=.5,
                     estimation.methods = list(
                     estBlackBox4=list(max.lag=3, verbose=F),
                     estVARXls=list(max.lag=3)), 
                     trend=T, zero=T)
tfplot(z)


###################################################
### code chunk number 23: Guide.Stex:317-319
###################################################
zz <- horizonForecasts(TSmodel(z, select=1), TSdata(z), 
                       horizons=c(1,3,6))


