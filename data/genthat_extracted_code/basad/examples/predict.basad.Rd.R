library(basad)


### Name: predict.basad
### Title: Basad prediction
### Aliases: predict.basad
### Keywords: regression

### ** Examples

## No test: 
#-----------------------------------------------------------
#Generate Data: The simulated high dimensional data
#-----------------------------------------------------------

n =  100; p = 499; nz = 5

rho1=0.25;rho2=0.25;rho3=0.25  ### correlations
Bc = c( 0,seq(0.6,3,length.out=nz), array(0, p-nz))

covr1=(1- rho1)*diag(nz) +  array(rho1,c(nz,nz))
covr3=(1- rho3)*diag(p-nz) +  array(rho3,c(p-nz,p-nz))
covr2=array(rho2,c(nz,p-nz))
covr=rbind( cbind(covr1,covr2), cbind(t(covr2),covr3) )

covE = eigen(covr)
covsq = covE$vectors %*% diag(sqrt(covE$values)) %*% t(covE$vectors)

Xs = matrix(rnorm(n*p), nrow = n); Xn = covsq %*% t(Xs)
X = cbind(array(1, n), t(Xn))
Y = X %*% Bc + rnorm(n); X <- X[,2:ncol(X)]


#-----------------------------------------------------------
#Run the algorithm and then predict
#-----------------------------------------------------------

obj <- basad( x = X, y = Y)
predict( obj, testx = X )

## End(No test)




