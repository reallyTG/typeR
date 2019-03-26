library(msma)


### Name: plot.msma
### Title: Plot msma
### Aliases: plot.msma

### ** Examples

tmpdata = simdata(n = 50, rho = 0.8, Yps = c(10, 12, 15), Xps = 20, seed=1)
X = tmpdata$X; Y = tmpdata$Y 

fit1 = msma(X, Y, comp=1, lambdaX=2, lambdaY=1:3)
plot(fit1)




