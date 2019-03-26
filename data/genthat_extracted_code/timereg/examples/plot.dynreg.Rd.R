library(timereg)


### Name: plot.dynreg
### Title: Plots estimates and test-processes
### Aliases: plot.dynreg
### Keywords: survival

### ** Examples


## No test: 
### runs slowly and therefore donttest 
data(csl)
indi.m<-rep(1,length(csl$lt))

# Fits time-varying regression model
out<-dynreg(prot~treat+prot.prev+sex+age,csl,
Surv(lt,rt,indi.m)~+1,start.time=0,max.time=3,id=csl$id,
n.sim=100,bandwidth=0.7,meansub=0)

par(mfrow=c(2,3))
# plots estimates 
plot(out)
# plots tests-processes for time-varying effects 
plot(out,score=TRUE)
## End(No test)




