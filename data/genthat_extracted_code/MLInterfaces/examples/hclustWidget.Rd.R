library(MLInterfaces)


### Name: hclustWidget
### Title: shiny-oriented GUI for cluster or classifier exploration
### Aliases: hclustWidget mlearnWidget
### Keywords: models

### ** Examples

# should run with example(hclustWidget, ask=FALSE)
if (interactive()) {
 library(shiny)
 library(MASS)
 data(crabs)
 cr = data.matrix(crabs[,-c(1:3)])
 au = crabs[,1:3]
 show(hclustWidget(cr, auxdf=au))
## must use stop widget button to proceed
  library(ALL)
  library(hgu95av2.db)
  data(ALL)
  show(mlearnWidget(ALL[1:500,], mol.biol~.))
 }



