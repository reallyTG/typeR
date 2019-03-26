library(GenForImp)


### Name: ForImp.PCA
### Title: Imputation of missing data by alternating Nearest Neighbour
###   Imputation and Principal Component Analysis
### Aliases: ForImp.PCA
### Keywords: multivariate NA nonparametric

### ** Examples

# EXAMPLE with multivariate skew-normal data (MSN)
# require('sn')
# number of variables
p <- 5
# association matrix
omega <- 0.8
Omega <- matrix(omega, p, p)
diag(Omega) <- 1
Omega
# skewness parameter
alpha <- 4
alpha <- rep(alpha,p)
alpha
# number of units
n <- 500
# percentage of missing values
percmiss <- 0.2
nummiss <- n*p*percmiss
nummiss
## computation of output parameters
## covariance matrix and univariate means and skewnesses
param <- list(xi=rep(0,p), Omega=Omega, alpha=alpha, nu=Inf)
cp <- dp2cp(param, "SN")
cp
# correlation matrix 
rho <- cov2cor(cp$var.cov)
rho
# generation of a complete matrix
set.seed(1)
x0 <- rmsn(n, Omega=Omega, alpha=alpha)
x0
# generating a matrix with missing data
x <- missing.gen(x0, nummiss) 
# imputing missing values
xForImpPCA <- ForImp.PCA(x)
xForImpPCA
# computing the Relative Mean Square Error
error <- sum(apply((x0-xForImpPCA)^2/diag(var(x0)),2,sum)) / n
error

# EXAMPLE with real data
data(airquality)
m0 <- airquality
m0
# selecting the first 4 columns, with quantitative data
m <- m0[, 1:4]
m
# imputation
mi <- ForImp.PCA(m)
mi
# plot of imputed values for variable "Ozone"
ozone.miss.ind <- which(is.na(m)[,1])
plot(mi[ozone.miss.ind,1], axes=FALSE, pch=19, ylab="imputed values of Ozone", 
  xlab="observation index")
axis(2)
axis(1, at=1:length(ozone.miss.ind), labels=ozone.miss.ind, las=2)
box()
abline(v=1:length(ozone.miss.ind), lty=3, col="grey")

# EXAMPLE with n < p: ForImp with PCO
# require('mvtnorm')
p <- 20
n <- 10
sigma <- matrix(0.4, p, p)
diag(sigma) <- 1
# complete matrix
set.seed(2)
xtrue <- rmvnorm(n=n, mean=rep(0, p), sigma=sigma)
rownames(xtrue) <- 1:n
colnames(xtrue) <- paste("V", 1:p, sep="")
xtrue 
# matrix with 10 missing values
xmiss <- missing.gen(xtrue, 10)
xmiss 
# number of missing values per unit
apply(is.na(xmiss),1,sum) 
# imputed matrix
ximp <- ForImp.PCA(xmiss)
ximp
# computing the Relative Mean Square Error
error <- sum(apply((xtrue-ximp)^2/diag(var(xtrue)),2,sum)) / n
error



