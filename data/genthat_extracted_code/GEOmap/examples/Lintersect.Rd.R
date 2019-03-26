library(GEOmap)


### Name: Lintersect
### Title: Finder intersection of lines
### Aliases: Lintersect
### Keywords: misc

### ** Examples



plot(c(-1,1), c(-1,1), type='n')

l1 = list(p1=list(x=-0.938, y=0.0860), p2=list(x=0.4006,y=0.9294))
l2 = list(p1=list(x=-0.375, y=0.0860), p2=list(x=-0.344,y=-0.8089))
points(l1$p1)
points(l1$p2)
points(l2$p1)
points(l2$p2)
segments(c(l1$p1$x, l2$p1$x), c(l1$p1$y, l2$p1$y), c(l1$p2$x, l2$p2$x), c(l1$p2$y, l2$p2$y) )


Lintersect(l1, l2)


plot(c(-1,1), c(-1,1), type='n')

l1 = list(p1=list(x=-0.83587, y=-0.5765), p2=list(x=0.731603,y=0.69705))
l2 = list(p1=list(x=-0.6114, y=0.7745), p2=list(x=0.48430,y=-0.63250))
points(l1$p1)
points(l1$p2)
points(l2$p1)
points(l2$p2)
segments(c(l1$p1$x, l2$p1$x), c(l1$p1$y, l2$p1$y), c(l1$p2$x, l2$p2$x), c(l1$p2$y, l2$p2$y) )

Lintersect(l1, l2)




