library(holdem)


### Name: mycount1
### Title: counts the unique values in a vector
### Aliases: mycount1
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
    ## returns sorted unique values of x and how many times each appears
b1 = sort(unique(x),decreasing=T)
b2 = length(b1)
b3 = rep(0,b2)
for(i in 1:b2) b3[i] = sum(x == b1[i])
list(v=b1, ct = b3)
  }



