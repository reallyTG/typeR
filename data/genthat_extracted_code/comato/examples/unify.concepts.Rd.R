library(comato)


### Name: unify.concepts
### Title: Unifying the concepts of a conceptmap object.
### Aliases: unify.concepts

### ** Examples

 data = rbind(
 cbind("1", "Object", "Class", "is instance of"),
 cbind("1", "Object", "Attribute", "has"),
 cbind("2", "Class", "Attribute", "possesses"),
 cbind("2", "Attribute", "Data-type", "has"),
 cbind("3", "Object", "Class", "is instance of")
 )
 cms = conceptmaps(data)
 
 unify.concepts(cms)



