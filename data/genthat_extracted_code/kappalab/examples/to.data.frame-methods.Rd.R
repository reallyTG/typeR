library(kappalab)


### Name: to.data.frame-methods
### Title: Puts a set function under the form of a data.frame
### Aliases: to.data.frame to.data.frame-methods
###   to.data.frame,Mobius.card.set.func-method
###   to.data.frame,Mobius.set.func-method
###   to.data.frame,card.set.func-method to.data.frame,set.func-method
### Keywords: methods

### ** Examples

## the Mobius representation of set function
a <- Mobius.set.func(-1:-16,4,4)

## to data.frame
d <- to.data.frame(a)
write.table(d,"my.set.func.csv",sep="\t") 



