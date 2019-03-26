library(holdem)


### Name: deal1
### Title: Deals the cards.
### Aliases: deal1

### ** Examples

## out of 1000 hands with 2 players, see how many times 
## both players get at least a straight, if neither ever folds.
n = 1000 
result = rep(0,n)
for(i in 1:n){
x1 = deal1(2)
b1 = handeval(c(x1$plnum1[1,],x1$brdnum1), c(x1$plsuit1[1,],x1$brdsuit1))
b2 = handeval(c(x1$plnum1[2,],x1$brdnum1), c(x1$plsuit1[2,],x1$brdsuit1))
if(min(b1,b2) > 4000000) result[i] = 1
}
sum(result>.5)
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(numpl){
    ## numpl is the number of players at the table
numcards = 2*numpl+5
crds1 = order(runif(52))[1:numcards]
crds2 = switch2(crds1)
num1 = crds2$num
suit1 = crds2$st 
brdnum1 = num1[(numcards-4):numcards]
brdsuit1 = suit1[(numcards-4):numcards]
plnum1 = matrix(num1[1:(2*numpl)],ncol=2)
plsuit1 = matrix(suit1[1:(2*numpl)],ncol=2)
## order them
for(i in c(1:numpl)){
if(plnum1[i,1]<plnum1[i,2]){
a = plnum1[i,1]
plnum1[i,1] = plnum1[i,2]
plnum1[i,2] = a
a = plsuit1[i,1]
plsuit1[i,1] = plsuit1[i,2]
plsuit1[i,2] = a
  }
  }
b9 = list(plnum1=plnum1, plsuit1=plsuit1,
brdnum1=brdnum1, brdsuit1=brdsuit1)
b9
  }	## end of deal1



