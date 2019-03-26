library(wheatmap)


### Name: BottomRightOf
### Title: Bottom right of
### Aliases: BottomRightOf

### ** Examples

WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(c(rnorm(100)+1,rnorm(100)), nrow=10),
    cmp=CMPar(brewer.name = 'RdGy'), BottomRightOf(just=c('left','top')))

WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(c(rnorm(100)+1,rnorm(100)), nrow=10),
    cmp=CMPar(brewer.name = 'RdGy'), BottomRightOf(just=c('left','bottom')))

WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(c(rnorm(100)+1,rnorm(100)), nrow=10),
    cmp=CMPar(brewer.name = 'RdGy'), BottomRightOf(just=c('right','bottom')))



