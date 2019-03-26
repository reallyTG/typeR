library(dtt)


### Name: dtt
### Title: Discrete Trigonometric Transforms
### Aliases: dtt dct dst dht
### Keywords: models

### ** Examples

x=seq(0,20,length=200)
y=x*sin(x)+cos(x)+5*cos(10*x)+rnorm(200,sd=0.1)
plot(y)
z=dct(y); z[151:200]=0; lines(dct(z,inverted=TRUE),col=2);
z=dct(y); z[21:200]=0; lines(dct(z,inverted=TRUE),col=4);



