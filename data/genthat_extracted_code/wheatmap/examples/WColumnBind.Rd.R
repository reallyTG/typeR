library(wheatmap)


### Name: WColumnBind
### Title: column bind non-overlapping objects
### Aliases: WColumnBind

### ** Examples

WHeatmap(matrix(rnorm(2000),nrow=40),name='a') +
  WHeatmap(matrix(rnorm(30), nrow=3), RightOf(),name='b') +
  WColorBarH(1:10, TopOf(WColumnBind('a','b')))



