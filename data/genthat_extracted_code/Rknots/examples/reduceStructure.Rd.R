library(Rknots)


### Name: reduceStructure
### Title: Structure reduction of an object of class 'Knot'
### Aliases: reduceStructure
### Keywords: structurereduction

### ** Examples

knot <- makeExampleKnot(k = TRUE)
knot <- newKnot(knot)

##reduce the structure
reduceStructure(knot, 'AB')
reduceStructure(knot, 'MSR')



