library(Rknots)


### Name: print-methods
### Title: print the content of the slots of a Knot object.
### Aliases: print,Knot-method
### Keywords: methods

### ** Examples

knot <- makeExampleKnot(k = TRUE)
knot <- newKnot(knot)
print(knot)

link <- makeExampleKnot(k = FALSE)
link <- newKnot(link$points3D, link$ends)
print(link)



