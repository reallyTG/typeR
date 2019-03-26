library(holdem)


### Name: switch2
### Title: Finds the cards corresponding to numbers between 1 and 52.
### Aliases: switch2
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
    ## takes a number 1-52, and turns it into a card: 
    ## returns a list, where the 1st is the number (2-14), and 2nd is suit (1-4).
    n = length(x)
    y = list(num=x, st=rep(1,n))
    for(i in c(1:n)){
	a = 1
	while(a>0){
	    if(y$num[i]<14) a = -1 else{y$st[i] = y$st[i]+1
		y$num[i] = y$num[i]-13
	    }
	}
    }
    y$num = y$num+1
    y
  } ## end of switch2



