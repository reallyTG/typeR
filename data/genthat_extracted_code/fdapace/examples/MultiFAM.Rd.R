library(fdapace)


### Name: MultiFAM
### Title: Functional Additive Models with Multiple Predictor Processes
### Aliases: MultiFAM

### ** Examples

set.seed(1000)

library(MASS)

f11 <- function(t) t
f12 <- function(t) 2*cos(2*pi*t/4)
f21 <- function(t) 1.5*sin(2*pi*t/4)
f22 <- function(t) 1.5*atan(2*pi*t/4)

n<-100
N<-200

sig <- matrix(c(2.0, 0.0, 0.5, -.2,
                0.0, 1.2, -.2, 0.3,
                0.5, -.2, 1.7, 0.0,
                -.2, 0.3, 0.0, 1.0),
              nrow=4,ncol=4)

scoreX <- mvrnorm(n,mu=rep(0,4),Sigma=sig)
scoreXTest <- mvrnorm(N,mu=rep(0,4),Sigma=sig)

Y <- f11(scoreX[,1]) + f12(scoreX[,2]) + f21(scoreX[,3]) + f22(scoreX[,4]) + rnorm(n,0,0.5)
YTest <- f11(scoreXTest[,1]) + f12(scoreXTest[,2]) + 
f21(scoreXTest[,3]) + f22(scoreXTest[,4]) + rnorm(N,0,0.5)

phi11 <- function(t) sqrt(2)*sin(2*pi*t)
phi12 <- function(t) sqrt(2)*sin(4*pi*t)
phi21 <- function(t) sqrt(2)*cos(2*pi*t)
phi22 <- function(t) sqrt(2)*cos(4*pi*t)

grid <- seq(0,1,length.out=21)
Lt <- Lx1 <- Lx2 <- list()
for (i in 1:n) {
  Lt[[i]] <- grid
  Lx1[[i]] <- scoreX[i,1]*phi11(grid) + scoreX[i,2]*phi12(grid) + rnorm(1,0,0.01)
  Lx2[[i]] <- scoreX[i,3]*phi21(grid) + scoreX[i,4]*phi22(grid) + rnorm(1,0,0.01)
}

LtTest <- Lx1Test <- Lx2Test <- list()
for (i in 1:N) {
  LtTest[[i]] <- grid
  Lx1Test[[i]] <- scoreXTest[i,1]*phi11(grid) + scoreXTest[i,2]*phi12(grid) + rnorm(1,0,0.01)
  Lx2Test[[i]] <- scoreXTest[i,3]*phi21(grid) + scoreXTest[i,4]*phi22(grid) + rnorm(1,0,0.01)
}

X1 <- list(Ly=Lx1, Lt=Lt)
X2 <- list(Ly=Lx2, Lt=Lt)

X1Test <- list(Ly=Lx1Test, Lt=LtTest)
X2Test <- list(Ly=Lx2Test, Lt=LtTest)

X <- list(X1, X2)
XTest <- list(X1Test, X2Test)

# estimation
sbf <- MultiFAM(Y=Y,X=X)

xi <- sbf$xi

par(mfrow=c(2,2))
j <- 1
p0 <- trapzRcpp(sort(xi[,j]),dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))
g11 <- f11(sort(xi[,j])) - 
trapzRcpp(sort(xi[,j]),f11(sort(xi[,j]))*dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))/p0
tmpSgn <- sign(sum(g11*sbf$SBFit[,j]))
plot(sort(xi[,j]),g11,type='l',col=2,ylim=c(-2.5,2.5),xlab='xi11')
points(sort(xi[,j]),tmpSgn*sbf$SBFit[order(xi[,j]),j],type='l')
legend('top',c('true','SBF'),col=c(2,1),lwd=2,bty='n',horiz=TRUE)

j <- 2
p0 <- trapzRcpp(sort(xi[,j]),dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))
g12 <- f12(sort(xi[,j])) - 
trapzRcpp(sort(xi[,j]),f12(sort(xi[,j]))*dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))/p0
tmpSgn <- sign(sum(g12*sbf$SBFit[,j]))
plot(sort(xi[,j]),g12,type='l',col=2,ylim=c(-2.5,2.5),xlab='xi12')
points(sort(xi[,j]),tmpSgn*sbf$SBFit[order(xi[,j]),j],type='l')
legend('top',c('true','SBF'),col=c(2,1),lwd=2,bty='n',horiz=TRUE)

j <- 3
p0 <- trapzRcpp(sort(xi[,j]),dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))
g21 <- f21(sort(xi[,j])) - 
trapzRcpp(sort(xi[,j]),f21(sort(xi[,j]))*dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))/p0
tmpSgn <- sign(sum(g21*sbf$SBFit[,j]))
plot(sort(xi[,j]),g21,type='l',col=2,ylim=c(-2.5,2.5),xlab='xi21')
points(sort(xi[,j]),tmpSgn*sbf$SBFit[order(xi[,j]),j],type='l')
legend('top',c('true','SBF'),col=c(2,1),lwd=2,bty='n',horiz=TRUE)

j <- 4
p0 <- trapzRcpp(sort(xi[,j]),dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))
g22 <- f22(sort(xi[,j])) - 
trapzRcpp(sort(xi[,j]),f22(sort(xi[,j]))*dnorm(sort(xi[,j]),0,sqrt(sig[j,j])))/p0
tmpSgn <- sign(sum(g22*sbf$SBFit[,j]))
plot(sort(xi[,j]),g22,type='l',col=2,ylim=c(-2.5,2.5),xlab='xi22')
points(sort(xi[,j]),tmpSgn*sbf$SBFit[order(xi[,j]),j],type='l')
legend('top',c('true','SBF'),col=c(2,1),lwd=2,bty='n',horiz=TRUE)

## Not run: 
##D # fitting
##D sbf <- MultiFAM(Y=Y,X=X,nEval=0)
##D yHat <- sbf$mu+apply(sbf$SBFit,1,'sum')
##D par(mfrow=c(1,1))
##D plot(yHat,Y)
##D abline(coef=c(0,1),col=2)
##D 
##D 
##D # R^2
##D R2 <- 1-sum((Y-yHat)^2)/sum((Y-mean(Y))^2)
##D R2
##D 
##D 
##D # prediction
##D sbf <- MultiFAM(Y=Y,X=X,XTest=XTest)
##D yHat <- sbf$mu+apply(sbf$SBFit,1,'sum')
##D par(mfrow=c(1,1))
##D plot(yHat,YTest)
##D abline(coef=c(0,1),col=2)
## End(Not run)



