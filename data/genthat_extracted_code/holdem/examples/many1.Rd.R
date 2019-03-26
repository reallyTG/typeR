library(holdem)


### Name: many1
### Title: function to run many Texas Hold'em tournaments.
### Aliases: many1
### Keywords: ~kwd1 ~kwd2

### ** Examples

name1 = c("gravity","tommy","ursula","timemachine","vera","william","xena")
decision1 = list(gravity, tommy, ursula, timemachine, vera, william, xena) 
z1 = many1(name1, decision1, 7)
z2 = z1[[2]]
barplot(z2,names.arg=name1[1:7],cex.names=.9)

## The function is currently defined as
function(name1, decision1, k,winners1=3, payouts1 = c(13,8,5)){
    ## runs k tournaments
    nplayers1 = length(name1)
    d1 = matrix(0,ncol=winners1,nrow=k) ## matrix of results
    d2 = rep(0,nplayers1) ## total pts for each player
    for(i in 1:k){
	cat("\n\n...................  TOURNAMENT NUMBER ",i,":  ................... \n\n")
	d1[i,] = tourn1(name1, decision1)
	for(j in 1:winners1) d2[d1[i,j]] = d2[d1[i,j]] + payouts1[j]
	print(rbind(1:nplayers1,d2))
	#locator(1)
    }
    list(d1,d2)
  } ## end of many1



