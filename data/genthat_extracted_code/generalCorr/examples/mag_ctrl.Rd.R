library(generalCorr)


### Name: mag_ctrl
### Title: After removing control variables, magnitude of effect of x on y,
###   and of y on x.
### Aliases: mag_ctrl
### Keywords: derivatives partial

### ** Examples


set.seed(123);x=sample(1:10); z=runif(10); y=1+2*x+3*z+rnorm(10)
options(np.messages=FALSE)
mag_ctrl(x,y,z)#dx/dy=0.47 is approximately 0.5, but dy/dx=1.41 is not approx=2,




