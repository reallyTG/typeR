library(wheatmap)


### Name: CMPar
### Title: Color Map Parameters
### Aliases: CMPar

### ** Examples

WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WColorBarV(1:20, cmp=CMPar(brewer.name = 'RdBu'), RightOf())



