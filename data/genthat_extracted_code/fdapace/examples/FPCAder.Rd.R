library(fdapace)


### Name: FPCAder
### Title: Take derivative of an FPCA object
### Aliases: FPCAder

### ** Examples


bw <- 0.2
kern <- 'epan'
set.seed(1)
n <- 100 
M <- 40
pts <- seq(0, 1, length.out=M)
lambdaTrue <- c(1, 0.8, 0.1)^2
sigma2 <- 0.1

samp2 <- MakeGPFunctionalData(n, M, pts, K=length(lambdaTrue), 
                              lambda=lambdaTrue, sigma=sqrt(sigma2), basisType='legendre01')
samp2 <- c(samp2, MakeFPCAInputs(tVec=pts, yVec=samp2$Yn))
fpcaObj <- FPCA(samp2$Ly, samp2$Lt, list(methodMuCovEst='smooth',
                userBwCov=bw, userBwMu=bw, kernel=kern, error=TRUE)) 
CreatePathPlot(fpcaObj, showObs=FALSE)

FPCoptn <- list(bw=bw, kernelType=kern, method='FPC')
DPCoptn <- list(bw=bw, kernelType=kern, method='DPC')
FPC <- FPCAder(fpcaObj, FPCoptn)
DPC <- FPCAder(fpcaObj, DPCoptn)

CreatePathPlot(FPC, ylim=c(-5, 10))
CreatePathPlot(DPC, ylim=c(-5, 10))

# Get the true derivatives
phi <-  CreateBasis(K=3, type='legendre01', pts=pts)
basisDerMat <- apply(phi, 2, function(x) 
                       ConvertSupport(seq(0, 1, length.out=M - 1), pts, diff(x) * (M - 1)))
trueDer <- matrix(1, n, M, byrow=TRUE) + tcrossprod(samp2$xi, basisDerMat)
matplot(t(trueDer), type='l', ylim=c(-5, 10))

# DPC is slightly better in terms of RMSE
mean((fitted(FPC) - trueDer)^2)
mean((fitted(DPC) - trueDer)^2)




