library(flood)


### Name: dGEVxGEV
### Title: Two-component generalized extreme value distribution (GEV)
### Aliases: dGEVxGEV pGEVxGEV qGEVxGEV rGEVxGEV

### ** Examples

# density and distribution function of a two-component GEV:
par(mfrow=c(3,1))
curve(dGEVxGEV(x, c(2,1,0.2), c(3,2,0.4)), from=0, to=20, ylab="Density", n=1000)
curve(pGEVxGEV(x, c(2,1,0.2), c(3,2,0.4)), from=0, to=20, ylab="Probability", n=1000)

# quantiles of a two-component GEV:
qGEVxGEV(p=c(0.9, 0.99), c(2,1,0.2), c(3,2,0.4))

# random numbers of a two-component GEV:
set.seed(23764)
rn <- rGEVxGEV(1000, c(2,1,0.1), c(3,2,0))
hist(rn, breaks=40, freq=FALSE, main="")
curve(dGEVxGEV(x, c(2,1,0.1), c(3,2,0)), from=0, to=20,
ylab="density", n=1000, col="red", add=TRUE)



