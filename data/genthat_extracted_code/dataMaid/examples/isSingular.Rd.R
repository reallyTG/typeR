library(dataMaid)


### Name: isSingular
### Title: Check if a variable only contains a single value
### Aliases: isSingular isEmpty

### ** Examples

singularVar <- c(rep("a", 10), NA, NA)
notSingularVar <- c("a", "a", "b", "c", "d", "e", "f", NA, NA)

isSingular(singularVar)
isSingular(notSingularVar)




