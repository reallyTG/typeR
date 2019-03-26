library(GEOmap)


### Name: pline
### Title: Point to line distance
### Aliases: pline
### Keywords: misc

### ** Examples

L=list()
L$x=c(-0.161416832868, 0.484046270443,-0.472622257679)
L$y=c(-0.735779816514, 0.306422018349, 0.192660550459)

P = pline(L$x[1], L$y[1], L$x[2], L$y[2], L$x[3], L$y[3])

plot(L$x, L$y, type='n', asp=1)
segments(L$x[1], L$y[1], L$x[2], L$y[2])
points( L$x[3], L$y[3])

segments(L$x[3], L$y[3], P[4], P[5], col='red')







