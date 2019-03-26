library(funData)


### Name: meanFunction
### Title: Mean for functional data
### Aliases: meanFunction

### ** Examples

### Univariate (one-dimensional support)
x <- seq(0, 2*pi, 0.01)
f1 <- funData(x, outer(seq(0.75, 1.25, 0.05), sin(x)))

plot(f1)
plot(meanFunction(f1), col = 1, lwd = 2, add = TRUE)

### Univariate (two-dimensional support)
f2 <- funData(list(1:5, 1:3), array(rep(1:5,each = 11, times = 3), dim = c(11,5,3)))
all.equal(f2[1], meanFunction(f2)) # f2 has 11 identical observations

### Multivariate
m1 <- multiFunData(f1,f2)
all.equal(m1[6], meanFunction(m1)) # observation 6 equals the pointwise mean

### Irregular
i1 <- irregFunData(argvals = list(1:3,1:3,1:3), X = list(1:3,2:4,3:5))
all.equal(meanFunction(i1), i1[2])
# don't run: functions are not defined on the same domain
## Not run: meanFunction(irregFunData(argvals = list(1:3,1:5), X = list(1:3,1:5))) 



