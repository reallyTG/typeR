library(NAM)


### Name: MLM Gibbs
### Title: Bayesian Mixed Model
### Aliases: gibbs ml gibbs2 plot.gibbs
### Keywords: BLUP BGS

### ** Examples


data(tpod)

# Fitting GBLUP
K = GRM(gen)
iK = chol2inv(K)
      
# FIT
test1 = gibbs(y,iK=iK,S=1)

# PLOT
par(mfrow=c(1,3))
plot(test1$Fit.mean,y,pch=20,lwd=2,col=3,main='GBLUP')
plot(test1,col=4,lwd=2)
      
# Heritability
print(paste('h2 =',round(test1$VC.estimate[1]/sum(test1$VC.estimate),3)))

# Fitting RKHS
G = GAU(gen)
EIG = eigen(G,symmetric = TRUE)
ev = 20
U = EIG$vectors[,1:ev]
iV = diag(1/EIG$values[1:ev])

# FIT
test2 = gibbs(y,Z=U,iK=iV,S=1)

# PLOT
par(mfrow=c(1,3))
plot(test2$Fit.mean,y,pch=20,lwd=2,col=2,main='RKHS')
plot(test2,col=3,lwd=2)
      
# Heritability
print(paste('h2 =',round(test2$VC.estimate[1]/sum(test2$VC.estimate),3)))





