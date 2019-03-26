library(sparr)


### Name: plot.bivden
### Title: Plotting sparr objects
### Aliases: plot.bivden plot.rrs plot.msden plot.stden plot.rrst

### ** Examples


## No test: 
data(pbc)
data(fmd)
data(burk)

# 'bivden' object
pbcden <- bivariate.density(split(pbc)$case,h0=3,hp=2,adapt=TRUE,davies.baddeley=0.05,verbose=FALSE)
plot(pbcden)
plot(pbcden,what="bw",main="PBC cases\n variable bandwidth surface",xlab="Easting",ylab="Northing")

# 'stden' object
burkden <- spattemp.density(burk$cases,tres=128) # observation times are stored in marks(burk$cases)
plot(burkden,fix.range=TRUE,sleep=0.1) # animation
plot(burkden,tselect=c(1000,3000),type="conditional") # spatial densities conditional on each time

# 'rrs' object
pbcrr <- risk(pbc,h0=4,hp=3,adapt=TRUE,tolerate=TRUE,davies.baddeley=0.025,edge="diggle")
plot(pbcrr) # default
plot(pbcrr,tol.args=list(levels=c(0.05,0.01),lty=2:1,col="seagreen4"),auto.axes=FALSE)

# 'rrst' object
f <- spattemp.density(fmd$cases,h=6,lambda=8)
g <- bivariate.density(fmd$controls,h0=6)
fmdrr <- spattemp.risk(f,g,tolerate=TRUE)
plot(fmdrr,sleep=0.1,fix.range=TRUE)
plot(fmdrr,type="conditional",sleep=0.1,tol.type="two.sided",
     tol.args=list(levels=0.05,drawlabels=FALSE))

# 'msden' object
pbcmult <- multiscale.density(split(pbc)$case,h0=4,h0fac=c(0.25,2.5))
plot(pbcmult) # densities
plot(pbcmult,what="edge") # edge correction surfaces
plot(pbcmult,what="bw") # bandwidth surfaces
## End(No test)



