library(PenCoxFrail)


### Name: int.approx
### Title: Approximation of a Cox likelihood intergral
### Aliases: int.approx

### ** Examples

## generate time grid and corresponding B-spline design matrix
time.grid <- seq(0,200,by=1)
B <- bs.design(x=time.grid, xl=min(time.grid), xr=max(time.grid), spline.degree=3, nbasis=5)

## specify spline coefficients and covariate vector (with upper integral bound as first component)
alpha <- c(0.1,0.2,0.05,0.1,0.15)
z <- c(time=100,age=25)

## calculate intergal from 0 to 100
int.approx(z=z,time.grid=time.grid,B=B,nbasis=5,alpha=alpha)



