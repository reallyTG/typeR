library(holdem)


### Name: twopair1
### Title: See if you have two pairs.
### Aliases: twopair1
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
## 225*highpair + 15*lowpair + next
a1 = mycount1(x)
a2 = a1$v
a3 = a1$ct
a4 = sum(a3>1.5)
if(a4<1.5) return(0)
a5 = sort(a2[a3>1.5],decreasing=T)
a6 = max(c(0,a2[(a2 != a5[1]) & (a2 != a5[2])]))
225*a5[1] + 15*a5[2] + a6
  }    ## end of twopair1



