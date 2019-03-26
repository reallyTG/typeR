library(crskdiag)


### Name: print.diagprop
### Title: Print diagprop object
### Aliases: print.diagprop

### ** Examples

library(crskdiag)
data(dat2)
out2 <- diag_crr(Crsk(time,cause)~z1+z2,data=dat2,test="prop",seed=1234)
print(out2)



