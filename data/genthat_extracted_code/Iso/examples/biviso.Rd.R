library(Iso)


### Name: biviso
### Title: Bivariate isotonic regression.
### Aliases: biviso
### Keywords: regression nonlinear

### ** Examples

x <- 1:20
y <- 1:10
xy <- outer(x,y,function(a,b){a+b+0.5*a*b}) + rnorm(200)
ixy <- biviso(xy)

set.seed(42)
u <- matrix(runif(400),20,20)
v <- biviso(u)
progress <- list()
for(n in 1:9) progress[[n]] <- biviso(u,ncycle=50*n,fatal=FALSE,warn=FALSE)



