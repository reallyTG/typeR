library(spagmix)


### Name: rrmix
### Title: Spatial relative risk surface generation
### Aliases: rrmix rrim

### ** Examples

set.seed(1)
gg <- rgmix(3,window=toywin,S=matrix(c(0.08^2,0,0,0.1^2),nrow=2),p0=0.2)

rho <- rrmix(g=gg,
             rhotspots=cbind(c(0.8,0.3),c(0.4,0.4),c(0.6,0.5),c(0.3,0.5)),
             rsds=c(0.005,0.025,0.01,0.025),
             rweights=c(3,2,10,5)*10)

rho.sample <- rrpoint(c(400,800),rho,toywin)


par(mfrow=c(2,2))
plot(rho$g,main="control density")
plot(rho$f,main="case density")
plot(rho$r,main="log relative risk surface")
plot(rho.sample$controls,main="sample data")
points(rho.sample$cases,col=2)
legend("topright",col=2:1,legend=c("cases","controls"),pch=1)



