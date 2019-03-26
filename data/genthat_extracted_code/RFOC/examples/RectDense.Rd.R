library(RFOC)


### Name: RectDense
### Title: Divide a region into rectangles based on density
### Aliases: RectDense
### Keywords: misc spatial

### ** Examples


x = rnorm(100)
y = rnorm(100)

plot(x,y)
u = par('usr')
RI = RectDense(x, y, icut=3, u=u, ndivs=10)

 rect(RI$icorns[,1],RI$icorns[,2],RI$icorns[,3],RI$icorns[,4], col=NA, border='blue')





