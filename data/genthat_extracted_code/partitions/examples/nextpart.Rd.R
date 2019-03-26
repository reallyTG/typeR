library(partitions)


### Name: nextpart
### Title: Next partition
### Aliases: nextpart islastpart firstpart nextdiffpart islastdiffpart
###   firstdiffpart nextrestrictedpart islastrestrictedpart
###   firstrestrictedpart nextblockpart islastblockpart firstblockpart
###   nextcomposition islastcomposition firstcomposition
### Keywords: math

### ** Examples


# Do the optimization in scrabble vignette, one partition at a time:
# (but with a smaller letter bag)
scrabble <- c(a=9 , b=2 , c=2 , d=4 , e=12 , f=2 , g=3)

f <- function(a){prod(choose(scrabble,a))/choose(sum(scrabble),7)}
bestsofar <- 0
a <- firstblockpart(scrabble,7)
while(!islastpart(a)){
  jj <- f(a)
  if(jj>bestsofar){
    bestsofar <- jj
    bestpart <- a
  }
  a <- nextblockpart(a,scrabble) 
}





