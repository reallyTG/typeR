library(midasr)


### Name: coef.midas_r
### Title: Extract coefficients of MIDAS regression
### Aliases: coef.midas_r

### ** Examples


#Simulate MIDAS regression
n<-250
trend<-c(1:n)
x<-rnorm(4*n)
z<-rnorm(12*n)
fn.x <- nealmon(p=c(1,-0.5),d=8)
fn.z <- nealmon(p=c(2,0.5,-0.1),d=17)
y<-2+0.1*trend+mls(x,0:7,4)%*%fn.x+mls(z,0:16,12)%*%fn.z+rnorm(n)
eqr<-midas_r(y ~ trend + mls(x, 0:7, 4, nealmon) +
             mls(z, 0:16, 12, nealmon),
             start = list(x = c(1, -0.5), z = c(2, 0.5, -0.1)))

coef(eqr)
coef(eqr, term_names = "x")
coef(eqr, midas = TRUE)
coef(eqr, midas = TRUE, term_names = "x")




