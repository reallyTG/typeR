library(codep)


### Name: eigenmap
### Title: Spatial eigenvector maps
### Aliases: eigenmap Wf.sqrd Wf.RBF Wf.binary Wf.PCNM Wf.Drayf1 Wf.Drayf2
###   Wf.Drayf3 eigenmap.score

### ** Examples

#
### Example 1: A linear transect.
#
data(Salmon)
#
## No boundaries provided for a function that requires them: a warning is issued
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.binary)
map # plot(map)
#
## Boundaries are provided: the function is happy
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.binary,boundaries=c(0,20))
map # plot(map)
#
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.Drayf1,boundaries=c(0,20))
map # plot(map)
#
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.Drayf2,boundaries=c(0,20))
map # plot(map)
#
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.Drayf3,boundaries=c(0,20),wpar=2)
map # plot(map)
#
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.PCNM,boundaries=c(0,20))
map # plot(map)
#
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.sqrd)
map # plot(map)
#
map <- eigenmap(x=Salmon[,"Position"],weighting=Wf.RBF,wpar=0.001)
map # plot(map)
#
### Example 2: Using predictior scores
#
smpl <- c(4,7,10,14,34,56,61,64)  # A sample to discard
map <- eigenmap(x=Salmon[-smpl,"Position"],weighting=Wf.sqrd)
scr <- eigenmap.score(object=map,target=as.matrix(dist(Salmon[,"Position"]))[,-smpl])
all(round(scr[-smpl,] - map$U, 10) == 0) # Scores of sampling points are the eigenvectors
scr[smpl,]
#
wh <- 5L   # You can try with other vectors.
plot(map$U[,wh]~Salmon[-smpl,"Position"], ylab = expression(U[5]),
     xlab = "Position along transect")
points(y=scr[smpl,wh],x=Salmon[smpl,"Position"],pch=21,bg="black")
#
map <- eigenmap(x=Salmon[-smpl,"Position"],weighting=Wf.binary,boundaries=c(0,20))
scr <- eigenmap.score(object=map,target=as.matrix(dist(Salmon[,"Position"]))[smpl,-smpl])
#
wh <- 1L   # You can try with other vectors.
plot(map$U[,wh]~Salmon[-smpl,"Position"], ylab = expression(U[1]),
     xlab = "Position along transect (m)")
points(y=scr[,wh],x=Salmon[smpl,"Position"],pch=21,bg="black")
#
map <- eigenmap(x=Salmon[-smpl,"Position"],weighting=Wf.PCNM,boundaries=c(0,100))
scr <- eigenmap.score(object=map,target=as.matrix(dist(Salmon[,"Position"]))[smpl,-smpl])
#
wh <- 1L   # You can try with other vectors.
plot(map$U[,wh]~Salmon[-smpl,"Position"], ylab = expression(U[1]),
     xlab = "Position along transect (m)")
points(y=scr[,wh],x=Salmon[smpl,"Position"],pch=21,bg="black")
#
### Example 3: A unevenly sampled surface.
#
data(Mite)
map <- eigenmap(x=as.matrix(mite.geo),weighting=Wf.sqrd)
map # plot(map)
#
map <- eigenmap(x=as.matrix(mite.geo),weighting=Wf.RBF)
map # plot(map)
#



