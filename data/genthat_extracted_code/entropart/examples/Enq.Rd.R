library(entropart)


### Name: Enq
### Title: Grassberger's expectation of n^q
### Aliases: Enq

### ** Examples

# Compare
n <- c(2,3)
Enq(n, q=2)
# with
n^2

# Result is 1
Enq(n, q=0)
# Result is 0
Enq(n, q=5)



