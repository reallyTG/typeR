library(vows)


### Name: funkmeans
### Title: Functional k-means clustering for parallel smooths
### Aliases: funkmeans

### ** Examples


data(test)
d4 = test$d4
x = test$x
semi.obj = semipar4d(d4, ~sf(x), -5:5, data.frame(x = x))
fdobj = extract.fd(semi.obj)
fkmobj = funkmeans4d(fdobj, d4, ncomp=6, centers=3)



