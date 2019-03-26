library(TeachingDemos)


### Name: slider
### Title: slider / button control widgets
### Aliases: slider
### Keywords: dynamic iplot

### ** Examples


# example 1, sliders only
## Not run: 
##D ## This example cannot be run by examples() but should work in an interactive R session
##D plot.sample.norm<-function(){
##D  refresh.code<-function(...){
##D    mu<-slider(no=1); sd<-slider(no=1); n<-slider(no=3)
##D    x<-rnorm(n,mu,sd)
##D    plot(x)
##D  }
##D  slider(refresh.code,sl.names=c("value of mu","value of sd","n number of observations"),
##D        sl.mins=c(-10,.01,5),sl.maxs=c(+10,50,100),sl.deltas=c(.01,.01,1),sl.defaults=c(0,1,20))
##D }
##D plot.sample.norm()
## End(Not run)

# example 2, sliders and buttons
## Not run: 
##D ## This example cannot be run by examples() but should work in an interactive R session
##D plot.sample.norm.2<-function(){
##D  refresh.code<-function(...){
##D    mu<-slider(no=1); sd<-slider(no=2); n<-slider(no=3)
##D    type=  slider(obj.name="type")
##D    x<-rnorm(n,mu,sd)
##D    plot(seq(x),x,ylim=c(-20,20),type=type)
##D  }
##D  slider(refresh.code,sl.names=c("value of mu","value of sd","n number of observations"),
##D        sl.mins=c(-10,.01,5),sl.maxs=c(10,10,100),sl.deltas=c(.01,.01,1),sl.defaults=c(0,1,20),
##D        but.functions=list(
##D               function(...){slider(obj.name="type",obj.value="l");refresh.code()},
##D               function(...){slider(obj.name="type",obj.value="p");refresh.code()},
##D               function(...){slider(obj.name="type",obj.value="b");refresh.code()}
##D        ),
##D        but.names=c("lines","points","both"))
##D   slider(obj.name="type",obj.value="l")
##D }
##D plot.sample.norm.2()
## End(Not run)

# example 3, dependent sliders
## Not run: 
##D ## This example cannot be run by examples() but should work in an interactive R session
##D print.of.p.and.q<-function(){
##D  refresh.code<-function(...){
##D    p.old<-slider(obj.name="p.old")
##D    p<-slider(no=1); if(abs(p-p.old)>0.001) {slider(set.no.value=c(2,1-p))}
##D    q<-slider(no=2); if(abs(q-(1-p))>0.001) {slider(set.no.value=c(1,1-q))}
##D    slider(obj.name="p.old",obj.value=p)
##D    cat("p=",p,"q=",1-p,"\n")
##D  }
##D  slider(refresh.code,sl.names=c("value of p","value of q"),
##D        sl.mins=c(0,0),sl.maxs=c(1,1),sl.deltas=c(.01,.01),sl.defaults=c(.2,.8))
##D  slider(obj.name="p.old",obj.value=slider(no=1))
##D }
##D print.of.p.and.q()
## End(Not run)

# example 4, rotating a surface
## Not run: 
##D ## This example cannot be run by examples() but should work in an interactive R session
##D R.veil.in.the.wind<-function(){
##D   # Mark Hempelmann / Peter Wolf
##D   par(bg="blue4", col="white", col.main="white",
##D       col.sub="white", font.sub=2, fg="white") # set colors and fonts
##D   samp  <- function(N,D) N*(1/4+D)/(1/4+D*N)
##D   z<-outer(seq(1, 800, by=10), seq(.0025, 0.2, .0025)^2/1.96^2, samp) # create 3d matrix
##D   h<-100
##D   z[10:70,20:25]<-z[10:70,20:25]+h; z[65:70,26:45]<-z[65:70,26:45]+h
##D   z[64:45,43:48]<-z[64:45,43:48]+h; z[44:39,26:45]<-z[44:39,26:45]+h
##D   x<-26:59; y<-11:38; zz<-outer(x,y,"+"); zz<-zz*(65<zz)*(zz<73)
##D   cz<-10+col(zz)[zz>0];rz<-25+row(zz)[zz>0]; z[cbind(cz,rz)]<-z[cbind(cz,rz)]+h
##D   refresh.code<-function(...){
##D     theta<-slider(no=1); phi<-slider(no=2)
##D     persp(x=seq(1,800,by=10),y=seq(.0025,0.2,.0025),z=z,theta=theta,phi=phi,
##D           scale=T, shade=.9, box=F, ltheta = 45,
##D           lphi = 45, col="aquamarine", border="NA",ticktype="detailed")
##D   }
##D   slider(refresh.code, c("theta", "phi"), c(0, 0),c(360, 360),c(.2, .2),c(85, 270)  )
##D }
##D R.veil.in.the.wind()
## End(Not run)






