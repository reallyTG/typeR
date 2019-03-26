library(OOmisc)


### Name: secant
### Title: A function to find roots of univariate functions.
### Aliases: secant
### Keywords: root finding numerical methods

### ** Examples

## Example-1
f1=function(x) x^3+sqrt(x)-1
secant(f1,0.5,0.55,10^-10,silent=FALSE)

## Example-2
f2=function(x) x^3-sinh(x)+4*x^2+6*x+9
# searching for reasonable initials
x0=seq(-10,10,,100)
plot(x0,f2(x0),type="n")
lines(x0,f2(x0))
x0=seq(6,8,,100)
plot(x0,f2(x0),type="n")
lines(x0,f2(x0))
abline(h=0,lty=2)

secant(f2,7,7.2,10^-10,maxit=30,silent=FALSE)



