library(GEOmap)


### Name: darc
### Title: Circular Arc
### Aliases: darc
### Keywords: misc

### ** Examples


plot(c(0,1), c(0,1), type='n', ann=FALSE, asp=1)

A = darc(.3, 23, 47, .5, .5, n=1)

lines(A$x, A$y)






