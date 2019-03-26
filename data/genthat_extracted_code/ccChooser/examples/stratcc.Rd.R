library(ccChooser)


### Name: stratcc
### Title: Stratified selection of core collections
### Aliases: stratcc

### ** Examples

data(dactylis_EC)
stratcc(dactylis_EC, dactylis_EC$UPGMA)
stratcc(dactylis_EC, dactylis_EC$UPGMA, clustering = TRUE, cluster_method = "average")



