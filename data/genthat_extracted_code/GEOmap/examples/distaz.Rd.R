library(GEOmap)


### Name: distaz
### Title: Distance and Azimuth from two points
### Aliases: distaz
### Keywords: misc

### ** Examples



####  one point
d = distaz(12, 23, -32,    -65)
d

####  many random target points
org = c(80.222, -100.940)
targ = cbind(runif(10, 10, 50), runif(10, 20, 100))


distaz(org[1], org[2], targ[,1], targ[,2])

############  if origin and target are identical
#####  the distance is zero, but the az and baz are not defined
distaz(80.222, -100.940, 80.222, -100.940)


########################   set one of the targets equal to the origin
targ[7,1] = org[1]
targ[7,2] = org[2]

distaz(org[1], org[2], targ[,1], targ[,2])

####  put in erroneous latitude data

targ[3,1] = -91.3


distaz(org[1], org[2], targ[,1], targ[,2])





