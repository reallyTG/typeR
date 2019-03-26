library(itertools)


### Name: ifilter
### Title: Create a filtering iterator
### Aliases: ifilter ifilterfalse
### Keywords: utilities

### ** Examples

# Return the odd numbers between 1 and 10
as.list(ifilter(function(x) x %% 2 == 1, icount(10)))

# Return the even numbers between 1 and 10
as.list(ifilterfalse(function(x) x %% 2 == 1, icount(10)))



