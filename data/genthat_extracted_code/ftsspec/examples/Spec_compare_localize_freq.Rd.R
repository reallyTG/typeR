library(ftsspec)


### Name: Spec_compare_localize_freq
### Title: Compare the spectral density operator of two Functional Time
###   Series and localize frequencies at which they differ.
### Aliases: Spec_compare_localize_freq

### ** Examples

ma.scale2=ma.scale1=c(-1.4,2.3,-2)
ma.scale2[3] = ma.scale1[3]+.0
a1=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale1)
a2=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale2)
X=Simulate_new_MA(a1, T.len=512, noise.type='wiener')
Y=Simulate_new_MA(a2, T.len=512, noise.type='wiener')
ans0=Spec_compare_localize_freq(X, Y, W=Epanechnikov_kernel, autok=2,
subgrid.density=10, verbose=0, demean=FALSE,
subgrid.density.relative.to.bandwidth=TRUE)
plot(ans0)
plot(ans0, method='fdr')
PvalAdjust(ans0, method='fdr') ## print FDR adjusted p-values
abline(h=.05, lty=3)
ans0=Spec_compare_localize_freq(X, Y, W=Epanechnikov_kernel, autok=0,
subgrid.density=10, verbose=0, demean=FALSE,
subgrid.density.relative.to.bandwidth=TRUE, K.fixed=4) ## fixed values of K
plot(ans0)
plot(ans0, 'fdr')
plot(ans0, 'holm')
PvalAdjust(ans0, method='fdr')
rm(ans0)



