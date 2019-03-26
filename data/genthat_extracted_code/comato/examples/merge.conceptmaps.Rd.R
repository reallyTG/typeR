library(comato)


### Name: merge.conceptmaps
### Title: Unify sets of conceptmaps
### Aliases: merge.conceptmaps

### ** Examples

 data = rbind(
 cbind("1", "Object", "Class", "is instance of"),
 cbind("1", "Object", "Attribute", "has"),
 cbind("2", "Class", "Attribute", "possesses"),
 cbind("2", "Attribute", "Data-type", "has"),
 cbind("3", "Object", "Class", "is instance of")
 )
 cm1 = conceptmaps(data[1:2,])
 cm2 = conceptmaps(data[3:5,])
 merge(cm1, cm2)



