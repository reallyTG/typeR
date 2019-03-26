library(holdem)


### Name: trip1
### Title: See if you have 3 of a kind.
### Aliases: trip1
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
## 225*triple + 15*next + next
a1 = mycount1(x)
a2 = a1$v
a3 = a1$ct
a4 = sum(a3 > 2.5)
if(a4 < 0.5) return(0)
a5 = sort(a2[a3>2.5],decreasing=T)
a6 = sort(c(0,0,x[(x != a5[1])]),decreasing=T)
225*a5[1] + 15*a6[1] + a6[2]
  }    ## end of trip1



