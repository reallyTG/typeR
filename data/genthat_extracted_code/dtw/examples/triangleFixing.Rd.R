library(dtw)


### Name: triangleFixing
### Title: Triangle Fixing algorithm for Metric Nearness
### Aliases: triangleFixing tri.ineq.show
### Keywords: cluster

### ** Examples

a<-matrix(0.2, 4,4)
a[4,2]<-0.8
a<-as.matrix(as.dist(a))
af<-triangleFixing(a)

tri.ineq.show(a)
stopifnot(tri.ineq.show(af)==NULL)

## Example in http://suvrit.de/work/soft/metricn.html
a<-matrix(c(0, 3, 7,
            3, 0, 1,
            7, 1, 0),3)
af<-triangleFixing(a)

tri.ineq.show(a)
stopifnot(tri.ineq.show(af)==NULL)




