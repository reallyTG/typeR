library(vocaldia)


### Name: igraph.vocaldia
### Title: igraph.vocaldia: Create an igraph vocalisation diagram
### Aliases: igraph.vocaldia

### ** Examples

data(vocdia)
if (require('igraph'))
    igraph.vocaldia(getSampledVocalMatrix(subset(atddia,
                                          id=='Abbott_Maddock_01'),
                  individual=TRUE, nodecolumn='speaker'))



