library(gamlss)


### Name: bfp
### Title: Functions to fit fractional polynomials in GAMLSS
### Aliases: bfp fp pp
### Keywords: regression

### ** Examples

data(abdom)
#fits polynomials with power 1 and .5 
mod1<-gamlss(y~bfp(x,c(1,0.5)),data=abdom)
# fit the best of one fractional polynomial
m1<-gamlss(y~fp(x,1),data=abdom)
# fit the best of two fractional polynomials
m2<-gamlss(y~fp(x,2),data=abdom)
# fit the best of three fractional polynomials
m3<-gamlss(y~fp(x,3),data=abdom)
# get the coefficient for the second model 
m2$mu.coefSmo
# now power polynomials using the best 2 fp c()
 m4 <- gamlss(y ~ pp(x, c(1,3)), data = abdom)
# This is not good idea in this case because
# if you look at the fitted values you see what it went wrong
plot(y~x,data=abdom)
lines(fitted(m2,"mu")~abdom$x,col="red")
lines(fitted(m4,"mu")~abdom$x,col="blue")



