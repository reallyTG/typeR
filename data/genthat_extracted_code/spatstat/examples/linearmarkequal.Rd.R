library(spatstat)


### Name: linearmarkequal
### Title: Mark Connection Function for Multitype Point Pattern on Linear
###   Network
### Aliases: linearmarkequal
### Keywords: spatial nonparametric

### ** Examples

   
   if(interactive()) {
     X <- chicago
   } else {
     X <- runiflpp(20, simplenet) %mark% sample(c("A","B"), 20,
     replace=TRUE)
   }
   p <- linearmarkequal(X)



