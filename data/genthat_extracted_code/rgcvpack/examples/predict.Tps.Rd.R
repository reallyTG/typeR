library(rgcvpack)


### Name: predict.Tps
### Title: Predicting Thin Plate Smoothing Spline
### Aliases: predict.Tps
### Keywords: smooth

### ** Examples


#the same test function as in fitTps
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

#predict the thin plate spline on a finer grid (50x50)
xf <- seq(1/26, 25/26, length=50); yf <- xf
zf <- predict(tpsfit1, expand.grid(xc=xf,yc=yf))

#plot the predicted result
persp(xf, yf, matrix(zf,50,50), theta=130, phi=20, expand=0.45,
      xlab="x1", ylab="x2", zlab="y", xlim=c(0,1), ylim=c(0,1),
      zlim=range(zc), ticktype="detailed", scale=FALSE,
      main="GCV Smoothing")



