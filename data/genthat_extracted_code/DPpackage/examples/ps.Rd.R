library(DPpackage)


### Name: ps
### Title: Specify a smoothing spline fit in a PSgam formula
### Aliases: ps
### Keywords: models regression nonparametric smooth

### ** Examples

   # fit Start using a smoothing spline with 4 df.
     y ~ Age + ps(Start, degree=4)
   # fit log(Start) using a smoothing spline with 5 df.
     y ~ Age + ps(log(Start), degree=5)



