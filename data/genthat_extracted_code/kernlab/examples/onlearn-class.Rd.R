library(kernlab)


### Name: onlearn-class
### Title: Class "onlearn"
### Aliases: onlearn-class alpha,onlearn-method b,onlearn-method
###   buffer,onlearn-method fit,onlearn-method kernelf,onlearn-method
###   kpar,onlearn-method predict,onlearn-method rho,onlearn-method rho
###   show,onlearn-method type,onlearn-method xmatrix,onlearn-method buffer
### Keywords: classes

### ** Examples


## create toy data set
x <- rbind(matrix(rnorm(100),,2),matrix(rnorm(100)+3,,2))
y <- matrix(c(rep(1,50),rep(-1,50)),,1)

## initialize onlearn object
on <- inlearn(2,kernel="rbfdot",kpar=list(sigma=0.2),
              type="classification")

## learn one data point at the time
for(i in sample(1:100,100))
on <- onlearn(on,x[i,],y[i],nu=0.03,lambda=0.1)

sign(predict(on,x))




