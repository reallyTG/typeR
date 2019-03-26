library(spagmix)


### Name: rrstmix
### Title: Spatiotemporal relative risk surface generation
### Aliases: rrstmix rrstim

### ** Examples

## No test: 
# time-varying control density
gg1 <- stgmix(mean=matrix(c(2,1,3,0,-1,5),nrow=3),
             vcv=array(c(1,0,0,0,1,0,0,0,1,2,0,0,0,1,0,0,0,2),dim=c(3,3,2)),
             window=shp2,tlim=c(0,6))
rsk1 <- rrstmix(g=gg1,rhotspots=matrix(c(-2,0,2,1,2,5.5),nrow=3),
               rsds=sqrt(cbind(rep(1.5,3),rep(0.25,3))),rweights=c(-0.5,5))
plot(rsk1$g,sleep=0.1,fix.range=TRUE)
plot(rsk1$f,sleep=0.1,fix.range=TRUE)
plot(rsk1$r,sleep=0.1,fix.range=TRUE)

# time-constant control density
set.seed(321)
gg2 <- rgmix(7,window=shp2)
rsk2 <- rrstmix(g=gg2,rhotspots=matrix(c(-1,-1,2,2.5,0,5),nrow=3),
                rsds=sqrt(cbind(rep(0.75,3),c(0.05,0.01,0.5))),
                rweights=c(-0.4,7),tlim=c(0,6),tres=64)
plot(rsk2$g,sleep=0.1,fix.range=TRUE)
plot(rsk2$f,sleep=0.1,fix.range=TRUE)
plot(rsk2$r,sleep=0.1,fix.range=TRUE)
## End(No test)



