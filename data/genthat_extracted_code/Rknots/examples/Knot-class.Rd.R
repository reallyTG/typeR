library(Rknots)


### Name: Knot-class
### Title: Class "Knot" - a container for knot and link coordinates and
###   ends
### Aliases: Knot-class
### Keywords: class

### ** Examples

# create an object of class 'Knot' by using new
link <- makeExampleKnot( k = FALSE )
new('Knot', points3D = link$points3D, ends = link$ends)

#or by means of the constructor
newKnot(points3D = link$points3D, ends = link$ends)

#for knots, it is sufficient to specify the 3D coordinates
#ends are set by default to numeric(0)
knot <- makeExampleKnot( k = TRUE )
newKnot(points3D = knot)

#for creating an example, use makeExampleKnot.
#knot: 
makeExampleKnot(k = TRUE)
#link:
makeExampleKnot(k = FALSE)



