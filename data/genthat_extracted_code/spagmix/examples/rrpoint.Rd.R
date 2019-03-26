library(spagmix)


### Name: rrpoint
### Title: Generate random case/control points in space or space-time
### Aliases: rrpoint rrstpoint

### ** Examples

# Using 'rrim' object:
set.seed(1)
gg <- rgmix(3,window=toywin,S=matrix(c(0.08^2,0,0,0.1^2),nrow=2),p0=0.2)
rho <- rrmix(g=gg,
             rhotspots=cbind(c(0.8,0.3),c(0.4,0.4),c(0.6,0.5),c(0.3,0.5)),
             rsds=c(0.005,0.025,0.01,0.025),
             rweights=c(3,2,10,5)*10)

rho.sample <- rrpoint(n=c(400,800),r=rho,W=toywin)

par(mfrow=c(2,2))
plot(rho$g,main="control density")
plot(rho$f,main="case density")
plot(rho$r,main="log relative risk surface")
plot(rho.sample$controls,main="sample data")
points(rho.sample$cases,col=2)
legend("topright",col=2:1,legend=c("cases","controls"),pch=1)


## No test: 
# Using 'rrs' object:
require("sparr")
data(pbc)
pbccas <- split(pbc)$case
pbccon <- split(pbc)$control
h0 <- OS(pbc,nstar="geometric")
f <- bivariate.density(pbccas,h0=h0,hp=2,adapt=TRUE,pilot.density=pbccas,
                       edge="diggle",davies.baddeley=0.05,verbose=FALSE)
g <- bivariate.density(pbccon,h0=h0,hp=2,adapt=TRUE,pilot.density=pbccas,
                       edge="diggle",davies.baddeley=0.05,verbose=FALSE)
pbcrr <- risk(f,g,tolerate=TRUE,verbose=FALSE)

pbcrr.pt <- rrpoint(n=1000,r=pbcrr)

par(mfrow=c(1,3))
plot(pbcrr)
plot(pbcrr.pt$cases)
plot(pbcrr.pt$controls)


# Using 'rrstim' object:
set.seed(321)
gg <- rgmix(7,window=shp2)
rsk <- rrstmix(g=gg,rhotspots=matrix(c(-1,-1,2,2.5,0,5),nrow=3),
               rsds=sqrt(cbind(rep(0.75,3),c(0.05,0.01,0.5))),
               rweights=c(-0.4,7),tlim=c(0,6),tres=64)
plot(rsk$r,fix.range=TRUE)

rsk.pt <- rrstpoint(1000,r=rsk,W=shp2)

par(mfrow=c(1,2))
plot(rsk.pt$cases)
plot(rsk.pt$controls)


# Using 'rrst' object:
require("sparr")
data(fmd)
fmdcas <- fmd$cases
fmdcon <- fmd$controls

f <- spattemp.density(fmdcas,h=6,lambda=8)
g <- bivariate.density(fmdcon,h0=6)
rho <- spattemp.risk(f,g)

rho.pt <- rrstpoint(1000,r=rho)

par(mfrow=c(1,2))
plot(rho.pt$cases)
plot(rho.pt$controls)
## End(No test)



