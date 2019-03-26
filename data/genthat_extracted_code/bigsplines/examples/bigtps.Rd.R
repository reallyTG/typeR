library(bigsplines)


### Name: bigtps
### Title: Fits Cubic Thin-Plate Splines
### Aliases: bigtps

### ** Examples


##########   EXAMPLE 1   ##########

# define relatively smooth function
set.seed(773)
myfun <- function(x){ sin(2*pi*x) }
x <- runif(500)
y <- myfun(x) + rnorm(500)

# fit thin-plate spline (default 1 dim: 30 knots)
tpsmod <- bigtps(x,y)
tpsmod


##########   EXAMPLE 2   ##########

# define more jagged function
set.seed(773)
myfun <- function(x){ 2*x+cos(2*pi*x) }
x <- runif(500)*4
y <- myfun(x) + rnorm(500)

# try different numbers of knots
r1mod <- bigtps(x,y,nknots=20,rparm=0.01)
crossprod( myfun(r1mod$xunique) - r1mod$fitted )/length(r1mod$fitted)
r2mod <- bigtps(x,y,nknots=35,rparm=0.01)
crossprod( myfun(r2mod$xunique) - r2mod$fitted )/length(r2mod$fitted)
r3mod <- bigtps(x,y,nknots=50,rparm=0.01)
crossprod( myfun(r3mod$xunique) - r3mod$fitted )/length(r3mod$fitted)


##########   EXAMPLE 3   ##########

# function with two continuous predictors
set.seed(773)
myfun <- function(x1v,x2v){
  sin(2*pi*x1v) + log(x2v+.1) + cos(pi*(x1v-x2v))
}
x <- cbind(runif(500),runif(500))
y <- myfun(x[,1],x[,2]) + rnorm(500)

# fit thin-plate spline with 50 knots (default 2 dim: 100 knots)
tpsmod <- bigtps(x,y,nknots=50)
tpsmod
crossprod( myfun(x[,1],x[,2]) - tpsmod$fitted.values )/500


##########   EXAMPLE 4   ##########

# function with three continuous predictors
set.seed(773)
myfun <- function(x1v,x2v,x3v){
  sin(2*pi*x1v) + log(x2v+.1) + cos(pi*x3v)
  }
x <- cbind(runif(500),runif(500),runif(500))
y <- myfun(x[,1],x[,2],x[,3]) + rnorm(500)

# fit thin-plate spline with 50 knots (default 3 dim: 200 knots)
tpsmod <- bigtps(x,y,nknots=50)
tpsmod
crossprod( myfun(x[,1],x[,2],x[,3]) - tpsmod$fitted.values )/500




