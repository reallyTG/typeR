library(funData)


### Name: simFunData
### Title: Simulate univariate functional data
### Aliases: simFunData

### ** Examples

oldPar <- par(no.readonly = TRUE)

# Use Legendre polynomials as eigenfunctions and a linear eigenvalue decrease
test <- simFunData(seq(0,1,0.01), M = 10, eFunType = "Poly", eValType = "linear", N = 10)

plot(test$trueFuns, main = "True Eigenfunctions")
plot(test$simData, main = "Simulated Data")

# The use of ignoreDeg for eFunType = "PolyHigh"
test <- simFunData(seq(0,1,0.01), M = 4, eFunType = "Poly", eValType = "linear", N = 10)
test_noConst <-  simFunData(seq(0,1,0.01), M = 4, eFunType = "PolyHigh",
                            ignoreDeg = 1, eValType = "linear", N = 10)
test_noLinear <-  simFunData(seq(0,1,0.01), M = 4, eFunType = "PolyHigh",
                             ignoreDeg = 2, eValType = "linear", N = 10)
test_noBoth <-  simFunData(seq(0,1,0.01), M = 4, eFunType = "PolyHigh",
                           ignoreDeg = 1:2, eValType = "linear", N = 10)

par(mfrow = c(2,2))
plot(test$trueFuns, main = "Standard polynomial basis (M = 4)")
plot(test_noConst$trueFuns, main = "No constant basis function")
plot(test_noLinear$trueFuns, main = "No linear basis function")
plot(test_noBoth$trueFuns, main = "Neither linear nor constant basis function")

# Higher-dimensional domains
simImages <- simFunData(argvals = list(seq(0,1,0.01), seq(-pi/2, pi/2, 0.02)), 
             M = c(5,4), eFunType = c("Wiener","Fourier"), eValType = "linear", N = 4)
for(i in 1:4) 
   plot(simImages$simData, obs = i, main = paste("Observation", i))
               
par(oldPar)



