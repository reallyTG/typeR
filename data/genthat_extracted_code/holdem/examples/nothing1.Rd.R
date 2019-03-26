library(holdem)


### Name: nothing1
### Title: indicates strength of your hand when you have nothing
### Aliases: nothing1
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
## 15^4*highest + 15^3*next + 225*next + 15*next + next
y = c(x,rep(0,5))  ## this is in case x has length < 5
a1 = sort(y,decreasing=T)
15*15*15*15*a1[1] + 15*15*15*a1[2] + 225*a1[3] + 15*a1[4] + a1[5]
  }	## end of nothing1



