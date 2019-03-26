library(gamair)


### Name: larynx
### Title: Cancer of the larynx in Germany
### Aliases: larynx german.polys
### Keywords: data

### ** Examples

require(gamair);require(mgcv)
data(larynx);data(german.polys)

## plot raw deaths over expected deaths by region...
polys.plot(german.polys,Larynx$Y/Larynx$E)

## Fit additive model with Gauss MRF for space and smooth of
## smoking level. k somewhat low to reduce computational time
b <- gam(Y~s(region,k=60,bs="mrf",xt=list(polys=german.polys)) +
offset(log(E))+s(x,k=10),family=poisson,data=Larynx,method="REML")

summary(b)
plot(b,scheme=c(0,1),pages=1)



