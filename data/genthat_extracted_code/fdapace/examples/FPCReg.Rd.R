library(fdapace)


### Name: FPCReg
### Title: Function for performing functonal linear regression where the
###   covariates are functions X1(t1),X2(t2),.. and the response is a
###   function Y(t_y).
### Aliases: FPCReg

### ** Examples

set.seed(1000)
#Model: E(Y(t)|X) = int(beta(s,t)*X(s))
n <- 200 #number of subjects
ngrids <- 51 #number of grids in [0,1] for X(s)
ngridt <- 101 #number of grids in [0,1] for Y(t)
grids <- seq(0, 1, length.out=ngrids) #regular grids in [0,1] for X(s)
gridt <- seq(0, 1, length.out=ngridt) #regular grids in [0,1] for Y(t)

#generate X
#{1, sqrt(2)*sin(2*pi*s), sqrt(2)*cos(2*pi*t)} are used to generate X.
eigenFun <- list( function(s){1 + 0 * s}, 
                  function(s){sqrt(2) * sin(2*pi*s)},
                  function(s){sqrt(2) * cos(2*pi*s)})

sig <- matrix(c(1.5, 0.0, 0.0, 0.9, -.5, 0.1,
                0.0, 1.2, 0.0, -.3, 0.8, 0.4,
                0.0, 0.0, 1.0, 0.4, -.3, 0.7,
                0.9, -.3, 0.4, 2.0, 0.0, 0.0,
                -.5, 0.8, -.3, 0.0, 1.5, 0.0,
                0.1, 0.4, 0.7, 0.0, 0.0, 1.0),
                nrow=6,ncol=6)

scoreX <- MASS::mvrnorm(n,mu=rep(0,6),Sigma=sig)
scoreX1 <- scoreX[,1:3]
scoreX2 <- scoreX[,4:6]

basisX1 <- sapply(eigenFun,function(x){x(grids)})
latentX1 <- scoreX1 %*% t(basisX1)
measErrX1 <- sqrt(0.03) * matrix(rnorm(n * ngrids), n, ngrids) #0.01 is sigma^2.
denseX1 <- latentX1 + measErrX1

basisX2 <- sapply(eigenFun,function(x){x(grids)})
latentX2 <- scoreX2 %*% t(basisX2)
measErrX2 <- sqrt(0.03) * matrix(rnorm(n * ngrids), n, ngrids) #0.01 is sigma^2.
denseX2 <- latentX2 + measErrX2

#generate Y
#beta(s, t) <- sin(2 * pi * s)*cos(2 * pi * t)
betaEigen1 <- function(t){f <- function(s){
                            sin(2*pi*s) * cos(2*pi*t) * (1+0*s)}; return(f)}
betaEigen2 <- function(t){f <- function(s){
                            sin(2*pi*s) * cos(2*pi*t) * (sqrt(2)*sin(2*pi*s))}; return(f)}
betaEigen3 <- function(t){f <- function(s){
                            sin(2*pi*s) * cos(2*pi*t) * (sqrt(2)*cos(2*pi*s))}; return(f)}
betaEigen <- list(betaEigen1, betaEigen2, betaEigen3) 
basisY <- array(0,c(ngridt, 3))
for(i in 1:3){
	intbetaEigen <- function (t) {integrate(betaEigen[[i]](t), lower = 0, upper = 1)$value}
	basisY[, i] <- sapply(1:ngridt, function(x){intbetaEigen(gridt[x])})
	}
latentY <- scoreX1 %*% t(basisY) - scoreX2 %*% t(basisY)
measErrY <- sqrt(0.01) * matrix(rnorm(n*ngridt), n, ngridt) #0.01 is sigma^2
denseY <- latentY + measErrY

#======Dense data===============================================
timeX <- t(matrix(rep(grids, n),length(grids), n))
timeY <- t(matrix(rep(gridt, n),length(gridt), n))
denseVars <- list(X1 = list(Ly = denseX1, Lt = timeX),
                  X2 = list(Ly = denseX2, Lt = timeX),
                  Y=list(Ly = denseY,Lt = timeY))

resuDense <- FPCReg(denseVars, method="FVE") 

par(mfrow=c(1,2))
estiBetaX1Y_Dense <- resuDense$estiBeta$betaX1Y
args1 <- list(xlab = 's', ylab = 't', zlab = 'estiBetaX1Y_Dense(s, t)',
              lighting = FALSE, phi = 45, theta = 45)
args2 <- list(x = 1:ngrids, y = 1:ngridt, z = estiBetaX1Y_Dense[1:ngrids, 1:ngridt])
do.call(plot3D::persp3D,c(args2, args1))

estiBetaX2Y_Dense <- resuDense$estiBeta$betaX2Y
args1 <- list(xlab = 's', ylab = 't', zlab = 'estiBetaX2Y_Dense(s, t)',
             lighting = FALSE, phi = 45, theta = 45)
args2 <- list(x = 1:ngrids, y = 1:ngridt, z = estiBetaX2Y_Dense[1:ngrids, 1:ngridt])
 # do.call(plot3D::persp3D,c(args2, args1))

#======Sparse data===============================================
## Not run: 
##D sparsity = 5:8
##D sparseX1 <- Sparsify(denseX1, grids, sparsity)
##D sparseX2 <- Sparsify(denseX2, grids, sparsity)
##D sparseY <- Sparsify(denseY, gridt, sparsity)
##D sparseVars <- list(X1 = sparseX1, X2 = sparseX2, Y = sparseY)
##D 
##D resuSparse <- FPCReg(sparseVars, method="FVE", FVEthreshold=0.98) 
##D #or resuSparse <- FPCReg(vars = sparseVars,
##D #                        varsOptns = list(X1=list(userBwCov = 0.03)))
##D 
##D par(mfrow=c(1,2))
##D estiBetaX1Y_Sparse = resuSparse$estiBeta$betaX1Y
##D args1 = list(xlab = 's', ylab = 't', zlab = 'estiBetaX1Y_Sparse(s,t)', 
##D              lighting = FALSE, phi = 45,theta = 45)
##D args2 = list(x = 1:51, y = 1:51, z = estiBetaX1Y_Sparse[1:51, 1:51])
##D do.call(plot3D::persp3D, c(args2, args1))
##D 
##D estiBetaX2Y_Sparse = resuSparse$estiBeta$betaX2Y
##D args1 = list(xlab = 's', ylab = 't', zlab = 'estiBetaX2Y_Sparse(s,t)', 
##D              lighting = FALSE, phi = 45,theta = 45)
##D args2 = list(x = 1:51, y = 1:51, z = estiBetaX2Y_Sparse[1:51, 1:51])
##D do.call(plot3D::persp3D, c(args2, args1))
##D 
##D par(mfrow=c(2,3))
##D for(i in 1:6){
##D 	plot(sparseVars[['Y']]$Lt[[i]], sparseVars[['Y']]$Ly[[i]], 
##D 	xlab = 'time', ylab = 'observations', ylim = c(-1.5, 1.5))
##D 	lines(seq(0, 1, length.out = 51), resuSparse$predictY[[i]])
##D 	lines(seq(0, 1, length.out = 51), resuSparse$cbandY[[i]][,2], lty = 2)
##D 	lines(seq(0, 1, length.out = 51), resuSparse$cbandY[[i]][,1], lty = 2)
##D 	}
##D 	
## End(Not run)



