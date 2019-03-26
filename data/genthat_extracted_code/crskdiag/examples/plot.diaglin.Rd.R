library(crskdiag)


### Name: plot.diaglin
### Title: Plot diaglin object
### Aliases: plot.diaglin

### ** Examples

library(crskdiag)
data(dat1)
out1 <- diag_crr(Crsk(time,cause)~z1+z2,data=dat1,test="lin",seed=1234)
plot(out1)



