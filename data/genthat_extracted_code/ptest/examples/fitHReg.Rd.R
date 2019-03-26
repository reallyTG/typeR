library(ptest)


### Name: fitHReg
### Title: Fits Three Parameter Harmonic Regression
### Aliases: fitHReg
### Keywords: ts

### ** Examples

set.seed(193)
z <- simHReg(10,f=2.5/10,1,1)
ans <- fitHReg(z)
ans$freq #optimal frequency = 0.2376238 
#
#ORF06806 in Cc dataset. 
z<-c(0.42, 0.89, 1.44, 1.98, 2.21, 2.04, 0.82, 0.62, 0.56, 0.8, 1.33)
ans2 <- fitHReg(z, algorithm="exact")
sum(resid(ans2)^2) #0.2037463
ans1 <- fitHReg(z)
sum(resid(ans1)^2) #0.242072
#compare with nls()
t <- 1:length(z)
ans <- nls(z ~ mu+alpha*cos(2*pi*lambda*t+phi), 
              start=list(mu=1, alpha=1, lambda=0.1, phi=0.0))
coefficients(ans)
sum(resid(ans)^2) #0.2037

                                                        



