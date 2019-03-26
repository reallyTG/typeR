library(geiger)


### Name: dcount
### Title: prior densities for truncated discrete random variable
### Aliases: dcount
### Keywords: arith

### ** Examples

range=0:100
u=dcount(range, FUN=dunif, min=min(range), max=max(range))
g=dcount(range, FUN=dgeom, prob=0.05)
p=dcount(range, FUN=dtpois, min=min(range), max=max(range), lambda=0.5)
priors=list(pois=p, geom=g, unif=u)
plot(range(range), c(0,1), xlab="index", ylab="cumsum(prob)", type="n", bty="n")
for(i in 1:length(priors)){
	points(attributes(attributes(priors[[i]])$density)$cumsum, col=i, pch=22, cex=0.35)
}
legend("bottomright", bty="n", legend=names(priors), col=1:length(priors), pch=22)


## LN prior probabilities
print(u(0))	## dunif
print(g(0))	## dgeom
print(p(0)) ## dtpois



