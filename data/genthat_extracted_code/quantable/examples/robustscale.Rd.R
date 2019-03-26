library(quantable)


### Name: robustscale
### Title: robust scaling uses median an mad instead of mean and row
###   applies the scaling to the columns (samples) by default
### Aliases: robustscale

### ** Examples

library(quantable)
tmp = matrix(rep((1:100),times = 4) + rnorm(100*4,0,3),ncol=4)
mean = c(20,30,10,40)
sd = c(4,3,4,5)
tmp = sweep(tmp,2,sd,"*")
tmp = sweep(tmp,2,mean,"+")
boxplot(tmp)
tmp = robustscale(tmp)
boxplot(tmp$data)



