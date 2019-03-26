library(magic)


### Name: allsums
### Title: Row, column, and two diagonal sums of arrays
### Aliases: allsums
### Keywords: array

### ** Examples

allsums(magic(7))
allsums(magic(7),func=max)

allsums(magic(7),func=range)
allsums(magic(7),func=function(x){x[1:2]})


allsums(magic(7),sort)
  # beware! compare apply(magic(7),1,sort) and apply(magic(7),2,sort)




