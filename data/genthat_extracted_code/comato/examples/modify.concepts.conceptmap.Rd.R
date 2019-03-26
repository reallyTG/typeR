library(comato)


### Name: modify.concepts.conceptmap
### Title: Adapt list of concepts of a conceptmap object
### Aliases: modify.concepts.conceptmap

### ** Examples

data = rbind(cbind("Object", "Class", "is instance of"), cbind("Class", "Attribute", "has"))
cm = conceptmap(data)
modify.concepts(cm, c("Object", "Class", "Method"))



