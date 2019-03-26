library(taRifx)


### Name: iapply
### Title: Iteratively (recursively) apply a function to its own output
### Aliases: iapply

### ** Examples

vec <- "xy12"
mylist <- list( c("x","a"), c("y","b"), c("a","f") )
iapply( mylist , FUN=function(repvec,x) {
  gsub(repvec[1],repvec[2],x)
}, init=vec )



