library(annotate)


### Name: GOmnplot
### Title: A function to plot by group means against each other.
### Aliases: GOmnplot KEGGmnplot KEGGmnplot,character,eSet,character-method
###   KEGGmnplot,character,matrix,character-method
### Keywords: manip

### ** Examples

  library("hgu95av2.db")
  data(sample.ExpressionSet)
  KEGGmnplot("04810", sample.ExpressionSet, sample.ExpressionSet$sex, 
             data = "hgu95av2")



