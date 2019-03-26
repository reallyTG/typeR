library(pvar)


### Name: pvar
### Title: p-variation calculation
### Aliases: pvar summary.pvar plot.pvar

### ** Examples

### randomised data:
x = rbridge(1000)

### the main functions:
pv = pvar(x, 2)
print(pv)
summary(pv)
plot(pv)

### The value of p-variation is    
pv; Sum_p(x[pv$partition], 2)  

### The meaning of supreme partition points:
pv.PP = pvar(x[pv$partition], TimeLabel=time(x)[pv$partition], 2)
pv.PP == pv.PP
op <- par(mfrow = c(2, 1), mar=c(2, 4, 4, 1))
plot(pv, main='pvar with original data')
plot(pv.PP, main='The same pvar without redundant points')
par(op)



