library(itertools2)


### Name: iproduct
### Title: Iterator that returns the Cartesian product of the arguments.
### Aliases: iproduct

### ** Examples

it <- iproduct(x=1:3, y=4:5)
iterators::nextElem(it) # list(x=1, y=4)
iterators::nextElem(it) # list(x=1, y=5)
iterators::nextElem(it) # list(x=2, y=4)
iterators::nextElem(it) # list(x=2, y=5)
iterators::nextElem(it) # list(x=3, y=4)
iterators::nextElem(it) # list(x=3, y=5)

# iproduct is a replacement for base::expand.grid()
# Large data.frames are not created unless the iterator is manually consumed
a <- 1:2
b <- 3:4
c <- 5:6
it2 <- iproduct(a=a, b=b, c=c)
df_iproduct <- do.call(rbind, as.list(it2))
df_iproduct <- data.frame(df_iproduct)

# Compare df_iproduct with the results from base::expand.grid()
base::expand.grid(a=a, b=b, c=c)



