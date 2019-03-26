library(holdem)


### Name: four1
### Title: Sees if you have 4 of a kind
### Aliases: four1

### ** Examples

x = c(8,8,8,8,13,12,2)
four1(x)
x = c(8,8,8,3,13,12,2)
four1(x)
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
## 15*number of the foursome + next
a1 = mycount1(x)
a2 = a1$v
a3 = a1$ct
a4 = sum(a3 > 3.5)
if(a4 < 0.5) return(0)
a5 = sort(a2[a3>3.5],decreasing=T)
a6 = sort(c(0,x[(x != a5[1])]),decreasing=T)
15*a5[1] + a6[1]
  }    ## end of four1



