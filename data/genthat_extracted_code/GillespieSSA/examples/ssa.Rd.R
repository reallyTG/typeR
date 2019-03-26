library(GillespieSSA)


### Name: ssa
### Title: Invoking the stochastic simulation algorithm
### Aliases: ssa
### Keywords: misc datagen ts

### ** Examples

## Irreversible isomerization
## Large initial population size (X=1000)
## Not run: 
##D parms <- c(c=0.5)
##D x0  <- c(X=10000)
##D a   <- c("c*X")
##D nu  <- matrix(-1)
##D out <- ssa(x0,a,nu,parms,tf=10,simName="Irreversible isomerization") # Direct method
##D plot(out$data[,1],out$data[,2]/10000,col="red",cex=0.5,pch=19)
## End(Not run)

## Smaller initial population size (X=100)
## Not run: 
##D x0  <- c(X=100)
##D out <- ssa(x0,a,nu,parms,tf=10) # Direct method
##D points(out$data[,1],out$data[,2]/100,col="green",cex=0.5,pch=19)
## End(Not run)

## Small initial population size (X=10)
## Not run: 
##D x0  <- c(X=10)
##D out <- ssa(x0,a,nu,parms,tf=10) # Direct method
##D points(out$data[,1],out$data[,2]/10,col="blue",cex=0.5,pch=19)
## End(Not run)

## Logistic growth
## Not run: 
##D parms <- c(b=2, d=1, K=1000)
##D x0  <- c(N=500)
##D a   <- c("b*N", "(d+(b-d)*N/K)*N")
##D nu  <- matrix(c(+1,-1),ncol=2)
##D out <- ssa(x0,a,nu,parms,tf=10,method="D",maxWallTime=5,simName="Logistic growth")
##D ssa.plot(out)
## End(Not run)

## Kermack-McKendrick SIR model 
## Not run: 
##D parms <- c(beta=0.001, gamma=0.1)
##D x0  <- c(S=499,I=1,R=0)
##D a   <- c("beta*S*I","gamma*I") 
##D nu  <- matrix(c(-1,0,+1,-1,0,+1),nrow=3,byrow=TRUE)
##D out <- ssa(x0,a,nu,parms,tf=100,simName="SIR model")
##D ssa.plot(out)
## End(Not run)

## Lotka predator-prey model
## Not run: 
##D parms <- c(c1=10, c2=.01, c3=10)
##D x0  <- c(Y1=1000,Y2=1000)
##D a   <- c("c1*Y1","c2*Y1*Y2","c3*Y2")
##D nu  <- matrix(c(+1,-1,0,0,+1,-1),nrow=2,byrow=TRUE) 
##D out <- ssa(x0,a,nu,parms,tf=100,method="ETL",simName="Lotka predator-prey model")
##D ssa.plot(out)
## End(Not run)



