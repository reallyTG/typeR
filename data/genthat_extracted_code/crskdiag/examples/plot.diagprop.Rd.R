library(crskdiag)


### Name: plot.diagprop
### Title: Plot diagprop object
### Aliases: plot.diagprop

### ** Examples

library(crskdiag)
data(dat2)
out2 <- diag_crr(Crsk(time,cause)~z1+z2,data=dat2,test="prop",seed=1234)
plot(out2)



