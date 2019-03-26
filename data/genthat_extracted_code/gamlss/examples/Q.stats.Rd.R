library(gamlss)


### Name: Q.stats
### Title: A function to calculate the Q-statistics
### Aliases: Q.stats
### Keywords: regression

### ** Examples

data(abdom)
h<-gamlss(y~pb(x), sigma.formula=~pb(x), family=BCT, data=abdom) 
Q.stats(h,xvar=abdom$x,n.inter=8)
Q.stats(h,xvar=abdom$x,n.inter=8,zvals=FALSE)
Q.stats(resid=resid(h),  xvar=abdom$x, n.inter=5)
rm(h)



