library(spam)


### Name: constructors
### Title: Slot modification
### Aliases: rowpointers rowpointers<- colindices colindices<- entries
###   entries<- dimension<- constructors
### Keywords: array

### ** Examples

x <- diag.spam( 2)  
rowpointers( x) <- c(1,1,3)

# The last line is equivalent to 
x@rowpointers <- as.integer( c(1,1,3))



