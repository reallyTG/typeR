library(ftsspec)


### Name: Spec
### Title: Compute Spectral Density of Functional Time Series
### Aliases: Spec

### ** Examples

ma.scale1=c(-1.4,2.3,-2)
a1=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale1)
X=Simulate_new_MA(a1, T.len=512, noise.type='wiener')
ans=Spec(X, trace=FALSE, only.diag=FALSE)
plot(ans)
plot(Spec(X, trace=FALSE, only.diag=FALSE, subgrid=TRUE, subgrid.density=10,
subgrid.density.relative.to.bandwidth=FALSE))
rm(ans)



