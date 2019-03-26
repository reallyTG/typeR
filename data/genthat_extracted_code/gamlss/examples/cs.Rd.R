library(gamlss)


### Name: cs
### Title: Specify a Smoothing Cubic Spline Fit in a GAMLSS Formula
### Aliases: cs scs cs.control
### Keywords: regression

### ** Examples

# cubic splines example
data(aids)
# fitting a smoothing cubic spline with 7 degrees of freedom
# plus the a quarterly  effect  
aids1<-gamlss(y~cs(x,df=7)+qrt,data=aids,family=PO) # 
aids2<-gamlss(y~scs(x,df=5)+qrt,data=aids,family=PO) # 
aids3<-gamlss(y~scs(x)+qrt,data=aids,family=PO) # using GCV 
with(aids, plot(x,y))
lines(aids$x,fitted(aids1), col="red")
lines(aids$x,fitted(aids3), col="green")
rm(aids1, aids2, aids3)



