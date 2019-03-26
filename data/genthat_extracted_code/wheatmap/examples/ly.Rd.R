library(wheatmap)


### Name: ly
### Title: show layout
### Aliases: ly

### ** Examples

ly(
  WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(rnorm(2000),nrow=40), cmp=CMPar(brewer.name = 'RdBu'),
    BottomRightOf(just=c('left','top'))))



