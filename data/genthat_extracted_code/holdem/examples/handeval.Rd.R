library(holdem)


### Name: handeval
### Title: Evaluates your hand.
### Aliases: handeval
### Keywords: ~kwd1 ~kwd2

### ** Examples

boardcards = c(4,5,6,8,13)
boardsuits = c(2,3,2,2,2)
player1cards = c(2,3)
player1suits = c(2,1)
player2cards = c(7,3)
player2suits = c(2,4)
handeval(c(boardcards,player1cards),c(boardsuits,player1suits)) ## pl.1's value
handeval(c(boardcards,player2cards),c(boardsuits,player2suits)) ## pl.2's value

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(num1,suit1){
    a1 = strflsh1(num1,suit1) 
    if(a1>0.5) return(8000000+a1)
    a1 = four1(num1)
    if(a1>0.5) return(7000000+a1)
    a1 = full1(num1)
    if(a1>0.5) return(6000000+a1)
    a1 = flush1(num1,suit1)
    if(a1>0.5) return(5000000+a1)
    a1 = straight1(num1)
    if(a1>0.5) return(4000000+a1)
    a1 = trip1(num1)
    if(a1>0.5) return(3000000+a1)
    a1 = twopair1(num1)
    if(a1>0.5) return(2000000+a1)
    a1 = onepair1(num1)
    if(a1>0.5) return(1000000+a1)
    a1 = nothing1(num1)
    return(a1)
  } ## end of handeval



