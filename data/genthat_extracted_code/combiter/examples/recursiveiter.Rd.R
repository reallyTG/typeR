library(combiter)


### Name: recursiveiter
### Title: Factory of Iterators defined by Recursive Transition Functions
### Aliases: recursiveiter

### ** Examples

fibiter <- recursiveiter(
  nextFunc = function(i) if (length(i)==1 && i==0) 1 else
                         if (length(i)==1 && i==1) c(1,1) else
                         c(sum(i), i[1]),
  prevFunc = NULL, firstFunc = function() 0, lastFunc = function() Inf)
for (k in 1:20) cat(nextElem(fibiter)[1], "")



