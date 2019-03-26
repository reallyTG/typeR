library(berryFunctions)


### Name: circle
### Title: Draw circle with a given radius
### Aliases: circle
### Keywords: aplot

### ** Examples


plot(1:20, type="n", asp=1)
circle(5,5, r=3)   # 1:1 aspect shows they're really circles and not ellipses.
circle(15,10, r=4, locnum=12, col=2, border=4, lwd=3)

# can not be vectorized:
x <- sample(1:20, 15) ;  y <- sample(1:20, 15) ; r <- runif(20)*3
circle(x,y,r, col=rgb(1,0.5,0,alpha=0.4), border=NA)
for(i in 1:15) circle(x[i],y[i],r[i], col=rgb(1,0.5,0,alpha=0.4), border=NA)




