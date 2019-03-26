library(MonoPhy)


### Name: GetAncNodes
### Title: Get MRCA nodes of taxonomic groups from 'AssessMonophyly' output
### Aliases: GetAncNodes

### ** Examples

data(Ericactree)
solution <- AssessMonophyly(Ericactree)
GetAncNodes(solution=solution, taxa=c("Phyllodoce", "Vaccinium", "Erica"))



