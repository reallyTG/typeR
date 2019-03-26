library(knotR)


### Name: as
### Title: Conversions between various forms of a knot
### Aliases: as as.knotvec as.minobj as.controlpoints as.inkscape
###   as.minsymvec

### ** Examples

as.minobj(k6_2)

x <- reader(system.file("6_3.svg",package="knotR"))  # x is class inkscape

as.minsymvec(x,symmetry_object(k6_3)) # as.minsymvec() needs a symmetry object

as.controlpoints(x)

as.knotvec(x)





