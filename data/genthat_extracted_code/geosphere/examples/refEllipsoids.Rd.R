library(geosphere)


### Name: refEllipsoids
### Title: Reference ellipsoids
### Aliases: refEllipsoids
### Keywords: methods spatial

### ** Examples

e <- refEllipsoids()
e[e$code=='WE', ]

#to compute semi-minor axis b:
e$b <- e$a - e$a / e$invf



