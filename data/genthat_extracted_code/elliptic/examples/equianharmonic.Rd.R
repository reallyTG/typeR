library(elliptic)


### Name: equianharmonic
### Title: Special cases of the Weierstrass elliptic function
### Aliases: equianharmonic lemniscatic pseudolemniscatic
### Keywords: math

### ** Examples

P(z=0.1+0.1212i,params=equianharmonic())


x <- seq(from=-10,to=10,len=200)
z <- outer(x,1i*x,"+")
view(x,x,P(z,params=lemniscatic()),real=FALSE)
view(x,x,P(z,params=pseudolemniscatic()),real=FALSE)
view(x,x,P(z,params=equianharmonic()),real=FALSE)




