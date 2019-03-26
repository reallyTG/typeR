library(rcosmo)


### Name: triangulate
### Title: Triangulate a polygonal 'CMBWindow'
### Aliases: triangulate

### ** Examples


## Example 1

win <- CMBWindow(theta = c(2*pi/3,3*pi/4,3*pi/4, 2*pi/3),
                 phi = c(pi/4,pi/4,pi/3,pi/3))
win
plot(win)
win1 <- triangulate(win)
win1
summary(win1[[1]])
plot(win1[[1]], add= FALSE, col="green")
plot(win1[[2]], col="blue")

## Example 2: triangilation minus-type polygon

win <- CMBWindow(theta = c(pi/5,pi/3,pi/4, pi/3, pi/5),
                 phi = c(pi/5,pi/5, pi/4 ,pi/3,pi/3), set.minus =TRUE)
win
plot(win)
summary(win)
win1 <- triangulate(win)
win1
plot(win1[[1]], add= FALSE, col="green")
plot(win1[[2]], col="blue")
plot(win1[[3]], col="yellow")
summary(win1[[1]])
summary(win1[[2]])
summary(win1[[3]])




