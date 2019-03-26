library(MonoPhy)


### Name: GetIntruderTaxa
### Title: Get taxa or tips which are intruders or outliers to a taxon from
###   AssessMonophyly
### Aliases: GetIntruderTaxa GetIntruderTips GetOutlierTaxa GetOutlierTips

### ** Examples

data(Ericactree)
solution <- AssessMonophyly(Ericactree)
GetIntruderTaxa(solution=solution)
GetOutlierTaxa(solution=solution)
GetIntruderTips(solution=solution, taxa=c("Phyllodoce", "Vaccinium", "Erica"))
GetOutlierTips(solution=solution, taxa=c("Vaccinium"))



