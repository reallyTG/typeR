library(ibr)


### Name: ibr
### Title: Iterative bias reduction smoothing
### Aliases: ibr print.ibr residuals.ibr
### Keywords: smooth multivariate

### ** Examples

f <- function(x, y) { .75*exp(-((9*x-2)^2 + (9*y-2)^2)/4) +
                      .75*exp(-((9*x+1)^2/49 + (9*y+1)^2/10)) +
                      .50*exp(-((9*x-7)^2 + (9*y-3)^2)/4) -
                      .20*exp(-((9*x-4)^2 + (9*y-7)^2)) }
# define a (fine) x-y grid and calculate the function values on the grid
ngrid <- 50; xf <- seq(0,1, length=ngrid+2)[-c(1,ngrid+2)]
yf <- xf ; zf <- outer(xf, yf, f)
grid <- cbind.data.frame(x=rep(xf, ngrid),y=rep(xf, rep(ngrid, ngrid)),z=as.vector(zf))
persp(xf, yf, zf, theta=130, phi=20, expand=0.45,main="True Function")
#generate a data set with function f and noise to signal ratio 5
noise <- .2 ; N <- 100 
xr <- seq(0.05,0.95,by=0.1) ; yr <- xr ; zr <- outer(xr,yr,f) ; set.seed(25)
std <- sqrt(noise*var(as.vector(zr))) ; noise <- rnorm(length(zr),0,std)
Z <- zr + matrix(noise,sqrt(N),sqrt(N))
# transpose the data to a column format 
xc <- rep(xr, sqrt(N)) ; yc <- rep(yr, rep(sqrt(N),sqrt(N)))
data <- cbind.data.frame(x=xc,y=yc,z=as.vector(Z))
# fit by thin plate splines (of order 2) ibr
res.ibr <- ibr(z~x+y,data=data,df=1.1,smoother="tps")
fit <- matrix(predict(res.ibr,grid),ngrid,ngrid)
persp(xf, yf, fit ,theta=130,phi=20,expand=0.45,main="Fit",zlab="fit")

## Not run: 
##D data(ozone, package = "ibr")
##D res.ibr <- ibr(Ozone~.,data=ozone,df=1.1)
##D summary(res.ibr)
##D predict(res.ibr)
## End(Not run)



