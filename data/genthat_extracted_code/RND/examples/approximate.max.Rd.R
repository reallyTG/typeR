library(RND)


### Name: approximate.max
### Title: Max Function Approximation
### Aliases: approximate.max
### Keywords: maximum numerical tricks

### ** Examples

#
# To see how the max function compares with approximate.max,
# run the following code.
#

i = seq(from = 0, to = 10, by = 0.25)
y = i - 5
max.values = pmax(0,y)
approximate.max.values = approximate.max(0,y,k=5)
matplot(i, cbind(max.values, approximate.max.values), lty = 1, type = "l", 
 col=c("black","red"), main = "Max in Black, Approximate Max in Red")



