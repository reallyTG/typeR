library(comato)


### Name: modify.concepts.conceptmaps
### Title: Modifying the concepts of all maps of a conceptmaps object.
### Aliases: modify.concepts.conceptmaps

### ** Examples

 data = rbind(
 cbind("1", "Object", "Class", "is instance of"),
 cbind("1", "Object", "Attribute", "has"),
 cbind("2", "Class", "Attribute", "possesses"),
 cbind("2", "Attribute", "Data-type", "has"),
 cbind("3", "Object", "Class", "is instance of")
 )
 cms = conceptmaps(data)
 
 modify.concepts(cms, c("Object", "Class"), filter=TRUE)



