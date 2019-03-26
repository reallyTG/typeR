library(OOmisc)


### Name: newton
### Title: A function to find the roots of univariate functions.
### Aliases: newton
### Keywords: root finding numerical methods

### ** Examples

# function and the derivative
f1=function(x) x^3+sqrt(x)-1
df1=function(x) 3*x^2+(1/2)*x^(-1/2)
# searching for a reasonable initial
x0=seq(0,2,,100)
plot(x0,f1(x0),type="n")
lines(x0,f1(x0))
abline(h=0,lty=2)
newton(f1,df1,0.5,10**-10,silent=FALSE)



