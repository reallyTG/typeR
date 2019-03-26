library(irtrees)


### Name: VerbAgg3
### Title: Verbal Aggression Data, Three-Category Items
### Aliases: VerbAgg3
### Keywords: datasets

### ** Examples

str(VerbAgg3)
mapping <- cbind(c(0,1,1), c(NA,0,1))
str(VerbAgg3T <- dendrify(VerbAgg3[,-c(1,2)], mapping))



