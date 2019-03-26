library(funData)


### Name: Arith.funData
### Title: Arithmetics for functional data objects
### Aliases: Arith.funData Arith,funData,funData-method
###   Arith,funData,numeric-method Arith,numeric,funData-method
###   Arith,multiFunData,multiFunData-method
###   Arith,multiFunData,numeric-method Arith,numeric,multiFunData-method
###   Arith,irregFunData,numeric-method Arith,numeric,irregFunData-method
###   Arith,irregFunData,irregFunData-method
###   Arith,irregFunData,funData-method Arith,funData,irregFunData-method

### ** Examples

oldpar <- par(no.readonly = TRUE)
par(mfrow = c(3,2), mar = rep(2.1,4))

argvals <- seq(0, 2*pi, 0.01)
object1 <- funData(argvals, outer(seq(0.75, 1.25, by = 0.05), sin(argvals)))
object2 <- funData(argvals, outer(seq(0.75, 1.25, by = 0.05), cos(argvals)))

plot(object1, main = "Object1")
plot(object2, main = "Object2")

# Only functional data objects
plot(object1 + object2, main = "Sum")
plot(object1 - object2, main = "Difference")

# Mixed
plot(4 * object1 + 5,  main = "4 * Object1 + 5") # Note y-axis!
plot(object1^2 + object2^2, main = "Pythagoras")

### Irregular
ind <- replicate(11, sort(sample(1:length(argvals), sample(5:10, 1))))
i1 <- irregFunData(
   argvals = lapply(1:11, function(i, ind, x){x[ind[[i]]]}, ind = ind, x = object1@argvals[[1]]),
   X = lapply(1:11, function(i, ind, y){y[i, ind[[i]]]}, ind = ind, y = object1@X))
i2 <- irregFunData(
   argvals = lapply(1:11, function(i, ind, x){x[ind[[i]]]}, ind = ind, x = object2@argvals[[1]]),
   X = lapply(1:11, function(i, ind, y){y[i, ind[[i]]]}, ind = ind, y = object2@X))

plot(i1, main = "Object 1 (irregular)")
plot(i2, main = "Object 2 (irregular)")

# Irregular and regular functional data objects
plot(i1 + i2, main = "Sum")
plot(i1 - object2, main = "Difference")

# Mixed
plot(4 * i1 + 5,  main = "4 * i1 + 5") # Note y-axis!
plot(i1^2 + i2^2, main = "Pythagoras")
par(oldpar)



