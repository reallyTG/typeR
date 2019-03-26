library(laGP)


### Name: randLine
### Title: Generate two-dimensional random paths
### Aliases: randLine
### Keywords: spatial random

### ** Examples

## 1. visualization of the randomly generated paths

## generate the paths
D <- 4
a <- c(-2, 2)
N <- 30
smin <- 0.1
res <- 100
line.set <- randLine(a=a, D=D, N=N, smin=smin, res=res)
  
## the indices of the randomly selected pair of input coordinates
d <- line.set$d

## visualization

## first create an empty plot
plot(0, xlim=a, ylim=a, type="l", xlab=paste("factor ", d[1], sep=""), 
     ylab=paste("factor ", d[2], sep=""), main="2d random paths")
abline(h=(a[1]+a[2])/2, v=(a[1]+a[2])/2, lty=2)
  
## merge each path type together
W <- unlist(list(line.set$lin, line.set$qua, line.set$cub, line.set$ep, line.set$ln), 
  recursive=FALSE)

## calculate colors to retain 
n <- unlist(lapply(line.set, length)[-6])
cols <- rep(c("orange", "blue", "forestgreen", "magenta", "cornflowerblue"), n)
  
#* plot randomly generated paths with a centering dot in red at the midway point
for(i in 1:N){
  lines(W[[i]][,1], W[[i]][,2], col=cols[i])
  points(W[[i]][res/2,1], W[[i]][res/2,2], col=2, pch=20)
}
  
## 2. use the random paths for out-of-sample prediction via laGPsep
  
## test function (same 2d function as in other examples package)
## (ignoring 4d nature of path generation above)
f2d <- function(x, y=NULL){
  if(is.null(y)){
     if(!is.matrix(x) && !is.data.frame(x)) x <- matrix(x, ncol=2)
     y <- x[,2]; x <- x[,1]
  }
  g <- function(z)
  return(exp(-(z-1)^2) + exp(-0.8*(z+1)^2) - 0.05*sin(8*(z+0.1)))
  z <- -g(x)*g(y)
}
    
## generate training data using 2d input space
x <- seq(a[1], a[2], by=0.02)
X <- as.matrix(expand.grid(x, x))
Y <- f2d(X)

## example of joint path calculation folowed by RMSE calculation
## on the first random path
WW <- W[[sample(1:N, 1)]]
WY <- f2d(WW)

## exhaustive search via ``joint" ALC
j.exh <- laGPsep(WW, 6, 100, X, Y, method="alcopt", close=10000, lite=FALSE)
sqrt(mean((WY - j.exh$mean)^2)) ## RMSE

## repeat for all thirty path elements (way too slow for checking) and other
## local design choices and visualize RMSE distribution(s) side-by-side
## Not run: 
##D    
##D   ## pre-allocate to save RMSE
##D   rmse.exh <- rmse.opt <- rmse.nn <- rmse.pw <- rmse.pwnn <- rep(NA, N)
##D   for(t in 1:N){
##D      
##D     WW <- W[[t]]
##D     WY <- f2d(WW)
##D        
##D     ## joint local design exhaustive search via ALC
##D     j.exh <- laGPsep(WW, 6, 100, X, Y, method="alc", close=10000, lite=FALSE)
##D     rmse.exh[t] <- sqrt(mean((WY - j.exh$mean)^2))
##D      
##D     ## joint local design gradient-based search via ALC
##D     j.opt <- laGPsep(WW, 6, 100, X, Y, method="alcopt", close=10000, lite=FALSE)
##D     rmse.opt[t] <- sqrt(mean((WY - j.opt$mean)^2))
##D     
##D     ## joint local design exhaustive search via NN
##D     j.nn <- laGPsep(WW, 6, 100, X, Y, method="nn", close=10000, lite=FALSE)
##D     rmse.nn[t] <- sqrt(mean((WY - j.nn$mean)^2))
##D      
##D     ## pointwise local design via ALC
##D     pw <- aGPsep(X, Y, WW, start=6, end=50, d=list(max=20), method="alc", verb=0)
##D     rmse.pw[t] <- sqrt(mean((WY - pw$mean)^2))
##D      
##D     ## pointwise local design via NN
##D     pw.nn <- aGPsep(X, Y, WW, start=6, end=50, d=list(max=20), method="nn", verb=0)   
##D     rmse.pwnn[t] <- sqrt(mean((WY - pw.nn$mean)^2))
##D      
##D     ## progress meter
##D     print(t)
##D   }
##D   
##D   ## justify the y range
##D   ylim_RMSE <- log(range(rmse.exh, rmse.opt, rmse.nn, rmse.pw, rmse.pwnn))
##D      
##D   ## plot the distribution of RMSE output
##D   boxplot(log(rmse.exh), log(rmse.opt), log(rmse.nn), log(rmse.pw), log(rmse.pwnn),
##D           xaxt='n', xlab="", ylab="log(RMSE)", ylim=ylim_RMSE, main="")
##D   axis(1, at=1:5, labels=c("ALC-ex", "ALC-opt", "NN", "ALC-pw", "NN-pw"), las=1)
## End(Not run)



