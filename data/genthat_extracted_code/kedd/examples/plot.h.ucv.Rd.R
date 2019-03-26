library(kedd)


### Name: plot.h.ucv
### Title: Plot for Unbiased Cross-Validation
### Aliases: plot.h.ucv lines.h.ucv
### Keywords: plot

### ** Examples

par(mfrow=c(2,1))
plot(h.ucv(trimodal,deriv.order=0),seq.bws=seq(0.06,0.2,length=50))
plot(h.ucv(trimodal,deriv.order=1),seq.bws=seq(0.06,0.2,length=50))



