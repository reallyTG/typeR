library(holdem)


### Name: straightdraw1
### Title: See if you have a straight draw.
### Aliases: straightdraw1
### Keywords: ~kwd1 ~kwd2

### ** Examples

straightdraw1(c(2,5,6,7,9,14))
straightdraw1(c(4,5,6,7,9,14))
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
    ## returns 4 is there are 2 possibilities for a straight. 
    ## returns 2 for a gutshot straight draw.
    ## returns 0 otherwise
    ## Note: returns 26 if you already have a straight!
    a1 = 0
    for(i in c(2:14)){
	a2 = straight1(c(i,x))
	if(a2 > .5) a1 = a1 + 1
    }
    a1 * 2 
  }	## end of straightdraw1



