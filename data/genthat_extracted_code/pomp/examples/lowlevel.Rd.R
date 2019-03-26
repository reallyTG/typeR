library(pomp)


### Name: Low-level-interface
### Title: pomp low-level interface
### Aliases: 'pomp low-level interface' rprocess rprocess,pomp-method
###   rprocess-pomp dprocess dprocess,pomp-method dprocess-pomp rmeasure
###   rmeasure,pomp-method rmeasure-pomp dmeasure dmeasure,pomp-method
###   dmeasure-pomp dprior dprior,pomp-method dprior-pomp rprior
###   rprior,pomp-method rprior-pomp init.state init.state,pomp-method
###   init.state-pomp skeleton skeleton,pomp-method skeleton-pomp
###   trajectory trajectory,pomp-method trajectory-pomp pompLoad
###   pompLoad-pomp pompLoad,pomp-method pompUnload pompUnload-pomp
###   pompUnload,pomp-method solibs<- solibs<-,pomp-method
###   print,unshowable-method print,listies-method show,unshowable-method
###   show,listies-method
### Keywords: programming

### ** Examples

pompExample(ricker)

p <- parmat(c(r=42,c=1,phi=10,sigma=0.3,N_0=7,e.0=0),10)
t <- c(1:10,20,30)
t0 <- 0
x0 <- init.state(ricker,params=p,t0=t0)
x <- rprocess(ricker,xstart=x0,times=c(t0,t),params=p,offset=1)
y <- rmeasure(ricker,params=p,x=x,times=t)
ll <- dmeasure(ricker,y=y[,3,,drop=FALSE],x=x,times=t,params=p,log=TRUE)
apply(ll,1,sum)
f <- skeleton(ricker,x=x,t=t,params=p)
z <- trajectory(ricker,params=p,times=t,t0=t0)

## short arguments are recycled:
p <- c(r=42,phi=10,c=1,sigma=0.3,N_0=7,e.0=0)
t <- c(1:10,20,30)
t0 <- 0
x0 <- init.state(ricker,params=p,t0=t0)
x <- rprocess(ricker,xstart=x0,times=c(t0,t),params=p,offset=1)
y <- rmeasure(ricker,params=p,x=x,times=t)
ll <- dmeasure(ricker,y=y,x=x,times=t,params=p,log=TRUE)
f <- skeleton(ricker,x=x,t=t,params=p)
z <- trajectory(ricker,params=p,times=t,t0=t0)



