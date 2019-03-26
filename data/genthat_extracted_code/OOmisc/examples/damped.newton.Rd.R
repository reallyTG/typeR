library(OOmisc)


### Name: damped.newton
### Title: A function to find the roots of univariate functions.
### Aliases: damped.newton
### Keywords: root finding numerical methods

### ** Examples

f1=function(x) x^3+sqrt(x)-1
df1=function(x) 3*x^2+(1/2)*x^(-1/2)
damped.newton(f1,df1,2,10^-10,maxit=40,silent=FALSE)



