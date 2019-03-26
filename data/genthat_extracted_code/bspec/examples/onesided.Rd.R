library(bspec)


### Name: one.sided
### Title: Conversion between one- and two-sided spectra
### Aliases: one.sided two.sided one.sided.bspec two.sided.bspec
### Keywords: ts

### ** Examples

lhspec <- bspec(lh)

# compare distributions visually:
par(mfrow=c(2,1))
  plot(lhspec)
  plot(two.sided(lhspec))
par(mfrow=c(1,1))

# ...and numerically:
print(cbind("frequency"=lhspec$freq,
            "median-1sided"=quantile(lhspec,0.5),
            "median-2sided"=quantile(two.sided(lhspec),0.5)))



