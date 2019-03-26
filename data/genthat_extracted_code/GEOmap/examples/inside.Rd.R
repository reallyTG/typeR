library(GEOmap)


### Name: inside
### Title: Determine if point is inside polygon
### Aliases: inside
### Keywords: misc

### ** Examples


####  make a polygon:
H=list()
H$x=c(-0.554,-0.258,0.062,0.538,0.701,0.332,
0.34,0.26,-0.189,0.081,0.519,0.644,0.264,-0.086,
-0.216,-0.246,-0.356,-1.022,-0.832,-0.372,-0.463,-0.604)
H$y=c(0.047,-0.4,-0.818,-0.822,-0.314,-0.25,
-0.491,-0.589,-0.396,-0.138,0.082,0.262,0.542,
0.361,0.03,0.555,0.869,0.912,0.641,0.327,0.142,0.129)

l1 = list(p1=list(x=-0.83587, y=-0.5765),
p2=list(x=0.731603,y=0.69705))
l2 = list(p1=list(x=-0.6114, y=0.7745),
p2=list(x=0.48430,y=-0.63250))

plot(c(-1,1), c(-1,1), type='n')

polygon(H, col=NULL, border='blue')
points(l1$p1)

####  if point is in polygon, return 1, else return 1
inside(l1$p1, H)
text(l1$p1  , labels=inside(l1$p1, H), pos=1)
points(l2$p1)
inside(l2$p1, H)
text(l2$p1  , labels=inside(l2$p1, H), pos=1)




