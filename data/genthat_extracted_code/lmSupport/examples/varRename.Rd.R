library(lmSupport)


### Name: varRename
### Title: Rename Variable in Dataframe
### Aliases: varRename
### Keywords: manip

### ** Examples

  d = data.frame(x=1:10, y=11:20)
  names(d)
  d = varRename(d, c('x', 'y'), c('x1', 'y1'))
  names(d)



