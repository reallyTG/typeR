library(wheatmap)


### Name: WRowBind
### Title: row bind non-overlapping objects
### Aliases: WRowBind

### ** Examples

WHeatmap(matrix(rnorm(2000),nrow=40),name='a') +
  WHeatmap(matrix(rnorm(30), nrow=3), Beneath(),name='b') +
  WColorBarV(1:10, LeftOf(WRowBind('a','b')))



