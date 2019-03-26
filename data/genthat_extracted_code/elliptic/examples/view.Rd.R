library(elliptic)


### Name: view
### Title: Visualization of complex functions
### Aliases: view
### Keywords: math

### ** Examples

n <- 100
x <- seq(from=-4,to=4,len=n)
y <- x
z <- outer(x,1i*y,"+")
view(x,y,limit(1/z),scheme=2)
view(x,y,limit(1/z),scheme=18)


view(x,y,limit(1/z+1/(z-1-1i)^2),scheme=5)
view(x,y,limit(1/z+1/(z-1-1i)^2),scheme=17)

view(x,y,log(0.4+0.7i+log(z/2)^2),main="Some interesting cut lines")


view(x,y,z^2,scheme=15,main="try finer resolution")
view(x,y,sn(z,m=1/2+0.3i),scheme=6,nlevels=33,drawlabels=FALSE)

view(x,y,limit(P(z,c(1+2.1i,1.3-3.2i))),scheme=2,nlevels=6,drawlabels=FALSE)
view(x,y,limit(Pdash(z,c(0,1))),scheme=6,nlevels=7,drawlabels=FALSE)
view(x,x,limit(zeta(z,c(1+1i,2-3i))),nlevels=6,scheme=4,col="white")

# Now an example with a bespoke colour function:

 fun <- function(z){hcl(h=360*wrap(Arg(z)),c= 100 * (Mod(z) < 1))}
 view(x,x,limit(zeta(z,c(1+1i,2-3i))),nlevels=6,scheme=fun)

view(scheme=10, show.scheme=TRUE)



