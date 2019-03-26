library(edrGraphicalTools)


### Name: edrGraphicalTools-package
### Title: Provides graphical tools for dimension reduction methods
### Aliases: edrGraphicalTools-package edrGraphicalTools
### Keywords: package

### ** Examples

## Sample generation
set.seed(10)
n <- 500
p <- 10
beta <- c(1,rep(0,p-1))
X <- rmvnorm(n,sigma=diag(p))
eps <- rnorm(n)
Y <- (X%*%beta)**3+eps*((X%*%beta)**2)

## Determining optimal values for H and K
grid.H <- c(2,5,10,15,20)
grid.K <- 1:p
res1 <- criterionRkh(Y,X,H=grid.H,K=grid.K,B=50,method="SIR-I")
#plot(res1,choice.H=c(2,5),choice.K=c(1,2))
HK <- which(res1$Rkhbootmean[,1:(p-1)] == max(res1$Rkhbootmean[,1:(p-1)]),
	arr.ind=TRUE)[1,]
H  <- grid.H[HK[1]]
K <- grid.K[HK[2]]

## Selecting relevant variables in X
if (K==1) {
	res2 <- edrSelec(Y, X, H, K, "CSS", pZero=p/2, NZero=200, zeta=0.05)
	dev.new()
	plot(res2)
	if (1 %in% which(res2$scoreVar == max(res2$scoreVar))) {
		message("The first variable is selected, as it should be.")
	} else {
		message("The variable selection failed.")
	} 
} else {
	message("The choice of K failed.")
}





