library(hypergate)


### Name: color_biplot_by_discrete
### Title: Colors a biplot according to a vector with discrete values
### Aliases: color_biplot_by_discrete

### ** Examples

data(Samusik_01_subset)
levels=unique(sort(Samusik_01_subset$labels))
colors=setNames(colorRampPalette(palette())(length(levels)),sort(levels))
with(Samusik_01_subset,color_biplot_by_discrete(matrix=tsne,discrete_vector=labels,colors=colors))



