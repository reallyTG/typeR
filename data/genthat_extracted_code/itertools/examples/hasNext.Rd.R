library(itertools)


### Name: hasNext
### Title: Does This Iterator Have A Next Element
### Aliases: hasNext hasNext.ihasNext
### Keywords: methods

### ** Examples

  it <- ihasNext(iter(c('a', 'b', 'c')))
  while (hasNext(it))
    print(nextElem(it))



