library(crossdes)


### Name: isGYD
### Title: Checking Simple Block and Row-Column Designs for Balance
### Aliases: isGYD
### Keywords: design

### ** Examples

d1 <- matrix( c(1,2,3,4,1,1,1,1), 4,2)          
# d1 is not balanced
d2 <- matrix( c(1:4,2:4,1,4,1:3,3,4,1,2),ncol=4)    
# d2 is a latin square
d3 <- matrix( rep(1:3,each=2), ncol=2)          
# d3 is a balanced incomplete block design.
d1
isGYD(d1,tables=TRUE)  
d2
isGYD(d2,tables=TRUE)
d3
isGYD(d3,tables=TRUE)    



