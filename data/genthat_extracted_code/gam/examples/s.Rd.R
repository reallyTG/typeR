library(gam)


### Name: s
### Title: Specify a Smoothing Spline Fit in a GAM Formula
### Aliases: s gam.s
### Keywords: models regression nonparametric smooth

### ** Examples

     # fit Start using a smoothing spline with 4 df.
     y ~ Age + s(Start, 4)
     # fit log(Start) using a smoothing spline with 5 df.
     y ~ Age + s(log(Start), df=5)
 


