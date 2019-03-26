library(basad)


### Name: basad
### Title: Bayesian variable selection with shrinking and diffusing priors
### Aliases: basad
### Keywords: regression

### ** Examples

## Don't show: 
#-----------------------------------------------------------
#Generate Data: The simulated low dimensional data
#-----------------------------------------------------------

n =  100; p = 99; nz = 5

rho1=0.25;rho2=0.25;rho3=0.25  ### correlations
Bc = c( 0,seq(0.6,3,length.out=nz), array(0, p-nz))

covr1=(1- rho1)*diag(nz) +  array(rho1,c(nz,nz))
covr3=(1- rho3)*diag(p-nz) +  array(rho3,c(p-nz,p-nz))
covr2=array(rho2,c(nz,p-nz))
covr=rbind( cbind(covr1,covr2), cbind(t(covr2),covr3) )

covE = eigen(covr)
covsq = covE$vectors %*% diag( sqrt(covE$values) ) %*% t(covE$vectors)

Xs = matrix( rnorm(n*p), nrow = n); Xn = covsq %*% t(Xs)
X = cbind(array(1, n), t(Xn))
Y = X %*% Bc + rnorm(n); X <- X[,2:ncol(X)]


#-----------------------------------------------------------
#Example 1: Run the default setting of the Guassian priors
#-----------------------------------------------------------

obj <- basad( x = X, y = Y)
print( obj )
## End(Don't show)
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
covsq = covE$vectors %*% diag( sqrt(covE$values) ) %*% t(covE$vectors)

Xs = matrix( rnorm(n*p), nrow = n); Xn = covsq %*% t(Xs)
X = cbind(array(1, n), t(Xn))
Y = X %*% Bc + rnorm(n); X <- X[,2:ncol(X)]


#-----------------------------------------------------------
#Example 1: Run the default setting of the Guassian priors
#-----------------------------------------------------------

obj <- basad( x = X, y = Y)
print( obj )

#-----------------------------------------------------------
#Example 2: Use different priors and slection criteria
#-----------------------------------------------------------

obj <- basad( x = X, y = Y, prior.dist = "t", select.cri = "BIC")
print( obj )
## End(No test)






