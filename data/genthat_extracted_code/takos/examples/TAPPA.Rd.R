library(takos)


### Name: TAPPA
### Title: Title Tangent area proportional method TAPPA
### Aliases: TAPPA

### ** Examples

npoints=1000
x=seq(1,npoints)
y=(dnorm(seq(1,npoints), mean=npoints/2, sd=npoints/10)) #simulated peak
y2=y+(dnorm(seq(1,npoints), mean=npoints, sd=npoints/10)) #secondary simulated peak
y2[seq(npoints*0.735,npoints)]=y2[763] #flat the curve at the end of first peak
ytap=TAPPA(x,y2)
plot(x,y2)
lines(x,ytap,col="red")



