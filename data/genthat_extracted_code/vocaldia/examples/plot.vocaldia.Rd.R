library(vocaldia)


### Name: plot.vocaldia
### Title: plot.vocaldia
### Aliases: plot.vocaldia

### ** Examples

data(vocdia)
if (require('igraph'))
 plot(getSampledVocalMatrix(subset(atddia, id=='Abbott_Maddock_01'),
                          individual=TRUE, nodecolumn='speaker'))



