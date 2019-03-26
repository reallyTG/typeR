library(VDSPCalibration)


### Name: calfun
### Title: Estimating the Calibration Equation
### Aliases: calfun

### ** Examples

n=100
sigma0=10

beta0=5
beta1=1.2
CVx=0.15
CVy=0.07

lambda0=CVy^2/CVx^2

x0=runif(n, 20, 200)
y0=beta0+beta1*x0+rnorm(n)*sigma0
x=x0+x0*CVx*rnorm(n)
y=y0+y0*CVy*rnorm(n)

fit=calfun(x, y, CVx, CVy, lambda0)
fit




