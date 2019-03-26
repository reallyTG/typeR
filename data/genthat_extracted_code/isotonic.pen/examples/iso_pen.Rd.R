library(isotonic.pen)


### Name: iso_pen
### Title: Penalized Isotonic Regression in one and two dimensions
### Aliases: iso_pen
### Keywords: isotonic monotone

### ** Examples

### plot the estimated expected lung volume of children given age and height
data(FEV)
x1=FEV[,1]   ## age
x2=FEV[,3]   ## height
y=FEV[,2]
ans=iso_pen(y,cbind(x1,x2))
persp(ans$xg1,ans$xg2,ans$xgmat,th=-40,tick="detailed",xlab="age",ylab="height",zlab="FEV")



