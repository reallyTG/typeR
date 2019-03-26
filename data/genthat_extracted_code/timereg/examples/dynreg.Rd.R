library(timereg)


### Name: dynreg
### Title: Fit time-varying regression model
### Aliases: dynreg
### Keywords: survival

### ** Examples


## No test: 
 
## this runs slowly and is therfore donttest
data(csl)
indi.m<-rep(1,length(csl$lt)) 

# Fits time-varying regression model 
out<-dynreg(prot~treat+prot.prev+sex+age,data=csl,
Surv(lt,rt,indi.m)~+1,start.time=0,max.time=2,id=csl$id,
n.sim=100,bandwidth=0.7,meansub=0)
summary(out)
par(mfrow=c(2,3))
plot(out)

# Fits time-varying semi-parametric regression model.
outS<-dynreg(prot~treat+const(prot.prev)+const(sex)+const(age),data=csl,
Surv(lt,rt,indi.m)~+1,start.time=0,max.time=2,id=csl$id,
n.sim=100,bandwidth=0.7,meansub=0)
summary(outS)
## End(No test)




