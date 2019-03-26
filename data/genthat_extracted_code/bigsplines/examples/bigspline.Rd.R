library(bigsplines)


### Name: bigspline
### Title: Fits Smoothing Spline
### Aliases: bigspline

### ** Examples


##########   EXAMPLE 1   ##########

# define relatively smooth function
set.seed(773)
myfun <- function(x){ sin(2*pi*x) }
x <- runif(10^6)
y <- myfun(x) + rnorm(10^6)

# linear, cubic, different cubic, and periodic splines
linmod <- bigspline(x,y,type="lin")
linmod
cubmod <- bigspline(x,y)
cubmod
cub0mod <- bigspline(x,y,type="cub0")
cub0mod
permod <- bigspline(x,y,type="per")
permod


##########   EXAMPLE 2   ##########

# define more jagged function
set.seed(773)
myfun <- function(x){ 2*x + cos(4*pi*x) }
x <- runif(10^6)*4
y <- myfun(x) + rnorm(10^6)

# try different numbers of knots
r1mod <- bigspline(x,y,nknots=20)
crossprod( myfun(r1mod$xunique) - r1mod$fitted )/length(r1mod$fitted)
r2mod <- bigspline(x,y,nknots=30)
crossprod( myfun(r2mod$xunique) - r2mod$fitted )/length(r2mod$fitted)
r3mod <- bigspline(x,y,nknots=40)
crossprod( myfun(r3mod$xunique) - r3mod$fitted )/length(r3mod$fitted)


##########   EXAMPLE 3   ##########

# define more jagged function
set.seed(773)
myfun <- function(x){ 2*x + cos(4*pi*x) }
x <- runif(10^6)*4
y <- myfun(x) + rnorm(10^6)

# try different rounding parameters
r1mod <- bigspline(x,y,rparm=0.05)
crossprod( myfun(r1mod$xunique) - r1mod$fitted )/length(r1mod$fitted)
r2mod <- bigspline(x,y,rparm=0.02)
crossprod( myfun(r2mod$xunique) - r2mod$fitted )/length(r2mod$fitted)
r3mod <- bigspline(x,y,rparm=0.01)
crossprod( myfun(r3mod$xunique) - r3mod$fitted )/length(r3mod$fitted)




