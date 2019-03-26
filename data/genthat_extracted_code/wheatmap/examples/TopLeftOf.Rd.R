library(wheatmap)


### Name: TopLeftOf
### Title: Top left of
### Aliases: TopLeftOf

### ** Examples

WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(c(rnorm(100)+1,rnorm(100)), nrow=10),
    cmp=CMPar(brewer.name = 'RdGy'), TopLeftOf(just=c('right','bottom')))

WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(c(rnorm(100)+1,rnorm(100)), nrow=10),
    cmp=CMPar(brewer.name = 'RdGy'), TopLeftOf(just=c('right','top')))

WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(c(rnorm(100)+1,rnorm(100)), nrow=10),
    cmp=CMPar(brewer.name = 'RdGy'), TopLeftOf(just=c('left','top')))



