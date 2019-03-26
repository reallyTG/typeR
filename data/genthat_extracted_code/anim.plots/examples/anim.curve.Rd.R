library(anim.plots)


### Name: anim.curve
### Title: Draw an animated curve.
### Aliases: anim.curve

### ** Examples

anim.curve(x^t, times=10:50/10, n=20)
anim.curve(sin(x*t), times=1:30, n=100, speed=12, col="darkgreen", from=-1, to=1)

## curve is constant in t, but window moves. 
## NB: 'from' and 'to' control where the expression is evaluated. 
## 'xlim' just controls the window.
anim.curve(sin(cos(-x)*exp(x/2)), times=0:100/10, from=-5, to=10, n=500, 
     col="red", lwd=2, xlim=rbind(top <- seq(-5, 10, 1/10), top+5))



