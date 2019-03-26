library(LotkasLaw)


### Name: LotkasN
### Title: Runs the creation of N in Lotkas Law
### Aliases: LotkasN
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
LotkasN <- function(Sums,FullTable)
{
  N <- nrow(FullTable)
  lx <- Sums[3]
  ly <- Sums[4]
  xy <- Sums[5]
  x2 <- Sums[6]
  lx2 <- lx^2
  top <- (N*xy) - (lx*ly)
  bottom <- (N*x2) - (lx2)
  Nfinal <- top/bottom
  return(Nfinal)
}



