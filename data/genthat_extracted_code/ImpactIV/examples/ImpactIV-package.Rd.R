library(ImpactIV)


### Name: ImpactIV-package
### Title: Identifying Causal Effect for Multi-Component Intervention Using
###   IV
### Aliases: ImpactIV-package ImpactIV
### Keywords: instrumental variable causal effect

### ** Examples


data(impact)
Z=impact$Z
A=impact$A
M=impact$M
Y=scale(impact$Y)
X=as.matrix(impact[,5:12])
##continuos variables of X
Xcon = X[, c(1,4,6,8)]
##discrete variables of X
Xdis = X[, c(2,3,5,7)]
##X^2
X2 = cbind(X, poly(Xcon, degree = 2, raw = TRUE), 
           Xcon*Xdis[,1], Xcon*Xdis[,2], Xcon*Xdis[,3], Xcon*Xdis[,4])

method1 = homo_IV1(Z = Z,A = A,M = M,Y = Y,X = X)
method2 = heter_IV2(Z = Z,A = A,M = M,Y = Y,X = X2, 
                   polydegree = 1, step1 = method1, 
                   truncate = 0.25, select ="AIC")




