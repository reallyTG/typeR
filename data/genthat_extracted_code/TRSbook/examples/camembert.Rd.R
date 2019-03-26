library(TRSbook)


### Name: camembert
### Title: Pie chart
### Aliases: camembert

### ** Examples

data(NUTRIELDERLY)
attach(NUTRIELDERLY)
require("RColorBrewer")
col <- brewer.pal(8,"Pastel2")
camembert(fat,col)
detach(NUTRIELDERLY)



