library(GEOmap)


### Name: inpoly
### Title: Test set of points for inside/outside polygon
### Aliases: inpoly
### Keywords: misc

### ** Examples

H=list()
H$x=c(-0.554,-0.258,0.062,0.538,0.701,0.332,
0.34,0.26,-0.189,0.081,0.519,0.644,0.264,
-0.086,-0.216,-0.246,-0.356,-1.022,-0.832,
-0.372,-0.463,-0.604)
H$y=c(0.047,-0.4,-0.818,-0.822,-0.314,-0.25,
-0.491,-0.589,-0.396,-0.138,0.082,0.262,0.542,
0.361,0.03,0.555,0.869,0.912,0.641,0.327,0.142,0.129)

plot(c(-1,1), c(-1,1), type='n')

polygon(H, col=NULL, border=grey(.8))

x = runif(20, -1,1)
y =  runif(20, -1,1)
points(list(x=x, y=y) )

inp = inpoly(x, y, H)

text(x[inp==0],y[inp==0], labels="out", pos=1, col='red')
text(x[inp==1],y[inp==1], labels="in", pos=1, col='blue')






