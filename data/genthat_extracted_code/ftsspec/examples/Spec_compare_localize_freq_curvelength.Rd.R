library(ftsspec)


### Name: Spec_compare_localize_freq_curvelength
### Title: Compare the spectral density operator of two Functional Time
###   Series and localize frequencies at which they differ, and (spatial)
###   regions where they differ
### Aliases: Spec_compare_localize_freq_curvelength

### ** Examples

ma.scale2=ma.scale1=c(-1.4,2.3,-2)
ma.scale2[3] = ma.scale1[3]+.4
a1=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale1)
a2=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale2)
X=Simulate_new_MA(a1, T.len=2^9, noise.type='wiener')
Y=Simulate_new_MA(a2, T.len=2^9, noise.type='wiener')
ans0=Spec_compare_localize_freq_curvelength(X, Y, W=Epanechnikov_kernel, alpha=.01, demean=TRUE)
print(ans0)
plot(ans0)
rm(ma.scale1, ma.scale2, a1, a2, X, Y, ans0)



