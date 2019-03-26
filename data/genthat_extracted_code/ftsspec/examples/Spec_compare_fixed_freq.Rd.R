library(ftsspec)


### Name: Spec_compare_fixed_freq
### Title: Test if two spectral density operators at some fixed frequency
###   are equal.
### Aliases: Spec_compare_fixed_freq

### ** Examples

ma.scale2=ma.scale1=c(-1.4,2.3,-2)
ma.scale2[3] = ma.scale1[3]+.3
a1=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale1)
a2=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale2)
X=Simulate_new_MA(a1, T.len=512, noise.type='wiener')
Y=Simulate_new_MA(a2, T.len=512, noise.type='wiener')
spec.X = Spec(X)
spec.Y = Spec(Y)
Spec_compare_fixed_freq(spec.X$spec[1,,], spec.Y$spec[1,,],
is.pi.multiple=TRUE, spec.X$m, spec.X$kappa.square)



