library(kedd)


### Name: plot.h.tcv
### Title: Plot for Trimmed Cross-Validation
### Aliases: plot.h.tcv lines.h.tcv
### Keywords: plot

### ** Examples

par(mfrow=c(2,1))
plot(h.tcv(trimodal,deriv.order=0),main="")
plot(h.tcv(trimodal,deriv.order=1),seq.bws=seq(0.1,0.5,length.out=50),main="")



