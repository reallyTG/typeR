library(cointReg)


### Name: checkObject
### Title: Variable check for single objects.
### Aliases: checkObject

### ** Examples

x = matrix(1:20, nrow = 2)
x2 = checkObject(x, "x.coint")
x2

env = environment()
y = 1:10
checkObject(y, out = "assign", .env = env)
y

# example for the use of the ... argument:
det = rbind(1, 1:10)
x3 = sin(10:20)
det2 = checkObject(deter = det)
det2
(checkObject(deter = det, x.stat = x3))




