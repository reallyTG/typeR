library(calibrator)


### Name: D1.fun
### Title: Function to join x.star to t.vec to give matrix D1
### Aliases: D1.fun
### Keywords: array

### ** Examples

data(toys)
jj <- extractor.toy(D1.toy)
x.star.toy <- jj$x.star
t.vec.toy  <- jj$t.vec
D1.fun(x.star.toy , t.vec.toy)  # both dataframes
D1.fun(x.star.toy , theta.toy)  # one dataframe, one vector
D1.fun(x.toy , t.vec.toy)       # one vector, one dataframe
D1.fun(x.toy,theta.toy)         # two vectors



