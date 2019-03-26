library(lmQCM)


### Name: lmQCM
### Title: lmQCM: Main Routine for Gene Co-expression Analysis
### Aliases: lmQCM

### ** Examples

library(lmQCM)
library(Biobase)
data(sample.ExpressionSet)
data = assayData(sample.ExpressionSet)$exprs
data = fastFilter(data, 0.2, 0.2)
lmQCM(data)




