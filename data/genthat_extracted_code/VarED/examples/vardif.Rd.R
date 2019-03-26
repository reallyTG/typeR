library(VarED)


### Name: vardif
### Title: Estimate Residual Variance with Differene-Based Method.
### Aliases: vardif

### ** Examples

x<-1:100/100
y<-5*sin(2*pi*x)+rnorm(100)*0.5
type="ord"
r<-2
m<-10
vardif(x,y,type,r,m)



