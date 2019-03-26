library(comato)


### Name: splice
### Title: Select a subset of a set of conceptmaps
### Aliases: splice

### ** Examples

 data = rbind(
 cbind("1", "Object", "Class", "is instance of"),
 cbind("1", "Object", "Attribute", "has"),
 cbind("2", "Class", "Attribute", "possesses"),
 cbind("2", "Attribute", "Data-type", "has"),
 cbind("3", "Object", "Class", "is instance of")
 )
 cms = conceptmaps(data)
 
 splice(cms, c(1,3))



