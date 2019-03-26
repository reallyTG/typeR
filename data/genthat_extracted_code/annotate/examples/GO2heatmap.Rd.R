library(annotate)


### Name: GO2heatmap
### Title: Compute a heatmap for the specified data, for either a GO
###   category or a KEGG pathway.
### Aliases: GO2heatmap KEGG2heatmap
###   KEGG2heatmap,character,eSet,character-method
###   KEGG2heatmap,character,matrix,character-method
### Keywords: manip

### ** Examples

  library("hgu95av2.db")
  data(sample.ExpressionSet)
  KEGG2heatmap("04810", sample.ExpressionSet, "hgu95av2")



