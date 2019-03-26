library(MonoPhy)


### Name: AssessMonophyly
### Title: Assesses monophyly (or lack of it) of taxonomic groups in a
###   phylogeny.
### Aliases: AssessMonophyly

### ** Examples

data(Ericactree)  # load tree
solution <- AssessMonophyly(Ericactree)  # run analysis
GetSummaryMonophyly(solution)  # extract summary table from output

#use custom taxonomic level
data(Ericactree)  # load tree
data(Ericactribes)  # load taxonomy file
solutiontribes <- AssessMonophyly(Ericactree, taxonomy=Ericactribes)  # run analysis
GetSummaryMonophyly(solutiontribes)  # extract summary table from output



