library(Rknots)


### Name: newKnot
### Title: Create a Knot object
### Aliases: newKnot
### Keywords: utilities

### ** Examples

knot <- makeExampleKnot(k = TRUE)
newKnot(knot)

link <- makeExampleKnot(k = FALSE)
newKnot(link$points3D, link$ends)



