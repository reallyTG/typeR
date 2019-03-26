library(validateRS)


### Name: par.dist.default
### Title: Create default parameters for a distribution
### Aliases: par.dist.default

### ** Examples

par.trian<-par.dist.default(dist="triangular", p.0=c(0.001, 0.004))

par.trnormal<-par.dist.default(dist="tr.normal", p.0=c(0.001, 0.004))

par.ownsample<-par.dist.default(dist="usersupplied", p.0=c(0.001, 0.004))
#first fill in your own list of p1.s
par.ownsample$param<-rbind(c(0.001, 0.01), c(0.004, 0.004), c(0.004, 0.01))
# see also \code{simulate.scenario}



