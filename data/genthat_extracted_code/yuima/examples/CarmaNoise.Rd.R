library(yuima)


### Name: CarmaNoise
### Title: Estimation for the underlying Levy in a carma model
### Aliases: Recovering.Noise Carma.Recovering CarmaRecovNoise CarmaNoise
###   Levy.Carma
### Keywords: ts

### ** Examples

## Not run: 
##D #Ex.1: Carma(p=3, q=0) process driven by a brownian motion.
##D 
##D mod0<-setCarma(p=3,q=0)
##D 
##D # We fix the autoregressive and moving average parameters
##D # to ensure the existence of a second order stationary solution for the process.
##D 
##D true.parm0 <-list(a1=4,a2=4.75,a3=1.5,b0=1)
##D 
##D # We simulate a trajectory of the Carma model.
##D 
##D numb.sim<-1000
##D samp0<-setSampling(Terminal=100,n=numb.sim)
##D set.seed(100)
##D incr.W<-matrix(rnorm(n=numb.sim,mean=0,sd=sqrt(100/numb.sim)),1,numb.sim)
##D 
##D sim0<-simulate(mod0,
##D                true.parameter=true.parm0,
##D                sampling=samp0, increment.W=incr.W)
##D 
##D #Applying the CarmaNoise
##D 
##D system.time(
##D   inc.Levy0<-CarmaNoise(sim0,true.parm0)
##D )
##D 
##D # We compare the orginal with the estimated noise increments 
##D 
##D par(mfrow=c(1,2))
##D plot(t(incr.W)[1:998],type="l", ylab="",xlab="time")
##D title(main="True Brownian Motion",font.main="1")
##D plot(inc.Levy0,type="l", main="Filtered Brownian Motion",font.main="1",ylab="",xlab="time")
##D 
##D # Ex.2: carma(2,1) driven  by a compound poisson
##D # where jump size is normally distributed and
##D # the lambda is equal to 1.
##D 
##D mod1<-setCarma(p=2,               
##D                q=1,
##D                measure=list(intensity="Lamb",df=list("dnorm(z, 0, 1)")),
##D                measure.type="CP") 
##D 
##D true.parm1 <-list(a1=1.39631, a2=0.05029,
##D                   b0=1,b1=2,
##D                   Lamb=1)
##D 
##D # We generate a sample path.
##D 
##D samp1<-setSampling(Terminal=100,n=200)
##D set.seed(123)
##D sim1<-simulate(mod1,
##D                true.parameter=true.parm1,
##D                sampling=samp1)
##D 
##D # We estimate the parameter using qmle.
##D carmaopt1 <- qmle(sim1, start=true.parm1)
##D summary(carmaopt1)
##D # Internally qmle uses CarmaNoise. The result is in 
##D plot(carmaopt1)
##D 
##D # Ex.3: Carma(p=2,q=1) with scale and location parameters 
##D # driven by a Compound Poisson
##D # with jump size normally distributed.
##D mod2<-setCarma(p=2,                
##D                q=1,
##D                loc.par="mu",
##D                scale.par="sig",
##D                measure=list(intensity="Lamb",df=list("dnorm(z, 0, 1)")),
##D                measure.type="CP") 
##D 
##D true.parm2 <-list(a1=1.39631,
##D                   a2=0.05029,
##D                   b0=1,
##D                   b1=2,
##D                   Lamb=1,
##D                   mu=0.5,
##D                   sig=0.23)
##D # We simulate the sample path 
##D set.seed(123)
##D sim2<-simulate(mod2,
##D                true.parameter=true.parm2,
##D                sampling=samp1)
##D 
##D # We estimate the Carma and we plot the underlying noise.
##D 
##D carmaopt2 <- qmle(sim2, start=true.parm2)
##D summary(carmaopt2)
##D 
##D # Increments estimated by CarmaNoise
##D plot(carmaopt2)
## End(Not run)



