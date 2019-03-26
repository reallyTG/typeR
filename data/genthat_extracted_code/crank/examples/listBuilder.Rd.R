library(crank)


### Name: listBuilder
### Title: Build a possibly nested list.
### Aliases: listBuilder
### Keywords: misc

### ** Examples

 # define a function that splits a vector into a list
 splitvec<-function(x) {
  xlen<-length(x)
  if(xlen > 1) {
   newx<-vector("list",xlen)
   for(newlist in 1:xlen) newx[[newlist]]<-x[newlist]
   return(newx)
  }
  return(x)
 }
 testlist<-list(c(9,16),list(25,c(36,49)))
 listBuilder(testlist,splitvec)



