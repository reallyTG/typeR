library(iterators)


### Name: ireadLines
### Title: Iterator over Lines of Text from a Connection
### Aliases: ireadLines
### Keywords: utilities

### ** Examples

  # create an iterator over the lines of COPYING
  it <- ireadLines(file.path(R.home(), 'COPYING'))
  nextElem(it)
  nextElem(it)
  nextElem(it)



