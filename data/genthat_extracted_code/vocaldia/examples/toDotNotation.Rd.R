library(vocaldia)


### Name: toDotNotation
### Title: toDotNotation: conver vocaldia to graphviz dot notation
### Aliases: toDotNotation

### ** Examples

data(vocdia)
toDotNotation(getSampledVocalMatrix(subset(atddia,
                                           id=='Abbott_Maddock_01'),
                             individual=TRUE, nodecolumn='speaker'))



