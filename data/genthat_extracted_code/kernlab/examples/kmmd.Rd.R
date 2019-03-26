library(kernlab)


### Name: kmmd
### Title: Kernel Maximum Mean Discrepancy.
### Aliases: kmmd kmmd,matrix-method kmmd,list-method
###   kmmd,kernelMatrix-method show,kmmd-method H0 Asymbound Radbound
###   mmdstats AsympH0
### Keywords: htest nonlinear nonparametric

### ** Examples

# create data
x <- matrix(runif(300),100)
y <- matrix(runif(300)+1,100)


mmdo <- kmmd(x, y)

mmdo



