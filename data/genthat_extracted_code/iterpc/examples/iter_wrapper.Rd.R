library(iterpc)


### Name: iter_wrapper
### Title: Wrap iterpc objects by iterators::iter
### Aliases: iter_wrapper

### ** Examples

library(iterators)
I <- iterpc(5, 2)
it <- iter_wrapper(I)
nextElem(it)
nextElem(it)

library(foreach)
I <- iterpc(5, 2)
it <- iter_wrapper(I)
foreach(x=it, .combine=c) %do% { sum(x) }



