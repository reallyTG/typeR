library(holdem)


### Name: straight1
### Title: See if you have a straight.
### Aliases: straight1
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
a1 = sort(unique(x))
if (length(a1)<4.5) return(0)
a3 = 0
n = length(a1)
if(a1[n] == 14) a1 = c(1,a1) ## count ace as both 1 and 14
a2 = length(a1)
for(j in c(5:a2)){ ## j will be the potential highest card of straight
    if( sum(15^c(1:5) * a1[(j-4):j]) == sum(15^c(1:5) * ((a1[j]-4):a1[j]))) a3 = a1[j]
  }
a3
  }	## end of straight1



