library(MortalitySmooth)


### Name: MortSmooth_bbase
### Title: Construct B-spline basis
### Aliases: MortSmooth_bbase
### Keywords: smooth

### ** Examples

x <- seq(0,1,length=500)
## B-splines basis of degree 1
B1 <- MortSmooth_bbase(x=x, xl=min(x), xr=max(x),
                       ndx=10, deg=1)
matplot(x, B1, t="l", main="B-splines basis of degree 1")
## B-splines basis of degree 3
B3 <- MortSmooth_bbase(x=x, xl=min(x), xr=max(x),
                       ndx=10, deg=3)
matplot(x, B3, t="l", main="B-splines basis of degree 3")



