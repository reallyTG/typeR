library(holdem)


### Name: holdem-package
### Title: Simulates Texas Hold'em hands and tournaments
### Aliases: holdem-package holdem
### Keywords: package

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

## run a Texas Hold'em tournament between 
## 4 players with different strategies, where 
## each always goes all in or folds.
name1 = c("gravity","tommy","ursula","vera")
decision1 = list(gravity, tommy, ursula, vera) 
tourn1(name1, decision1, myfast1 = 2) ## run quickly
tourn1(name1, decision1, myfast1 = 0) ## run slowly, showing key hands



