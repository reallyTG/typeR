library(msma)


### Name: summary.msma
### Title: Summarizing Fits
### Aliases: summary.msma print.summary.msma

### ** Examples

##### data #####
tmpdata = simdata(n = 50, rho = 0.8, Yps = c(10, 12, 15), Xps = 20, seed=1)
X = tmpdata$X; Y = tmpdata$Y 

fit1 = msma(X, Y, comp=1, lambdaX=2, lambdaY=1:3)
summary(fit1)




