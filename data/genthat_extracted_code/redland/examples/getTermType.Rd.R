library(redland)


### Name: getTermType
### Title: Return the redland node type for the specified RDF term in a
###   statement
### Aliases: getTermType getTermType,Statement,character-method

### ** Examples

world <- new("World")
subject <- new("Node", blank="_:myid1", world)
predicate <- new("Node", uri="http://www.example.com/isa", world)
object <- new("Node", literal="thing", world)
stmt <- new("Statement", world, subject, predicate, object, world)
termType <- getTermType(stmt, "predicate")



