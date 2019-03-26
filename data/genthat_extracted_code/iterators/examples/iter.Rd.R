library(iterators)


### Name: iter
### Title: Iterator Factory Functions
### Aliases: iter iter.default iter.iter iter.matrix iter.data.frame
###   iter.function
### Keywords: methods

### ** Examples

  # a vector iterator
  i1 <- iter(1:3)
  nextElem(i1)
  nextElem(i1)
  nextElem(i1)

  # a vector iterator with a checkFunc
  i1 <- iter(1:3, checkFunc=function(i) i %% 2 == 0)
  nextElem(i1)

  # a data frame iterator by column
  i2 <- iter(data.frame(x=1:3, y=10, z=c('a', 'b', 'c')))
  nextElem(i2)
  nextElem(i2)
  nextElem(i2)

  # a data frame iterator by row
  i3 <- iter(data.frame(x=1:3, y=10), by='row')
  nextElem(i3)
  nextElem(i3)
  nextElem(i3)

  # a function iterator
  i4 <- iter(function() rnorm(1))
  nextElem(i4)
  nextElem(i4)
  nextElem(i4)



