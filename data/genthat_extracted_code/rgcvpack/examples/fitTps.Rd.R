library(rgcvpack)


### Name: fitTps
### Title: Fitting Thin Plate Smoothing Spline
### Aliases: fitTps
### Keywords: smooth

### ** Examples


#define the test function
f <- function(x, y) { .75*exp(-((9*x-2)^2 + (9*y-2)^2)/4) +
                      .75*exp(-((9*x+1)^2/49 + (9*y+1)^2/10)) +
                      .50*exp(-((9*x-7)^2 + (9*y-3)^2)/4) -
                      .20*exp(-((9*x-4)^2 + (9*y-7)^2)) }

#generate a data set with the test function
set.seed(200)
N <- 13; xr <- (2*(1:N) - 1)/(2*N); yr <- xr
zr <- outer(xr, yr, f); zrmax <- max(abs(zr))

noise <- rnorm(N^2, 0, 0.07*zrmax)
zr <- zr + noise #this is the noisy data we will use

#convert the data into column form
xc <- rep(xr, N)
yc <- rep(yr, rep(N,N))
zc <- as.vector(zr)

#fit the thin plate spline with all the data points as knots
tpsfit1 <- fitTps(cbind(xc,yc), zc, m=2, scale.type="none")
persp(xr, yr, matrix(predict(tpsfit1),N,N), theta=130, phi=20,
      expand=0.45, xlab="x1", ylab="x2", zlab="y", xlim=c(0,1),
      ylim=c(0,1),zlim=range(zc), ticktype="detailed", scale=FALSE,
      main="GCV Smooth I")

#fit the thin plate spline with subset of data points as knots
grid.list  <- list(xc=seq(2/13,11/13,len=10),
                   yc=seq(2/13,11/13,len=10))
knots.grid <- expand.grid(grid.list)

tpsfit2 <- fitTps(cbind(xc,yc), zc, m=2, knots=knots.grid)
persp(xr, yr, matrix(predict(tpsfit2),N,N), theta=130, phi=20,
      expand=0.45, xlab="x1", ylab="x2", zlab="y", xlim=c(0,1),
      ylim=c(0,1),zlim=range(zc), ticktype="detailed", scale=FALSE,
      main="GCV Smooth II")



