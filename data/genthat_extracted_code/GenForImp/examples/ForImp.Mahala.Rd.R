library(GenForImp)


### Name: ForImp.Mahala
### Title: Imputation of missing data by using Nearest Neighbour Imputation
###   with the Mahalanobis distance
### Aliases: ForImp.Mahala
### Keywords: multivariate NA nonparametric

### ** Examples

# EXAMPLE with multivariate normal data (MVN)
# require('mvtnorm')
# number of variables
p <- 5
# correlation matrix
rho <- 0.8
Rho <- matrix(rho, p, p)
diag(Rho) <- 1
Rho
# mean vector
vmean <- rep(0,p)
vmean
# number of units
n <- 1000
# percentage of missing values
percmiss <- 0.2
nummiss <- n*p*percmiss
nummiss
# generation of a complete matrix
set.seed(1)
x0 <- rmvnorm(n, mean=vmean, sigma=Rho)
x0
# generating a matrix with missing data
x <- missing.gen(x0, nummiss) 
# imputing missing values
xForImpMahala <- ForImp.Mahala(x)
xForImpMahala
# computing the Relative Mean Square Error
error <- sum(apply((x0-xForImpMahala)^2/diag(var(x0)),2,sum)) / n
error


# EXAMPLE with real data
data(airquality)
m0 <- airquality
m0
# selecting the first 4 columns, with quantitative data
m <- m0[, 1:4]
m
# imputation
mi <- ForImp.Mahala(m)
mi
# plot of imputed values for variable "Ozone"
ozone.miss.ind <- which(is.na(m)[,1])
plot(mi[ozone.miss.ind,1], axes=FALSE, pch=19, ylab="imputed values of Ozone", 
  xlab="observation index")
axis(2)
axis(1, at=1:length(ozone.miss.ind), labels=ozone.miss.ind, las=2)
box()
abline(v=1:length(ozone.miss.ind), lty=3, col="grey")



