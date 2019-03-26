library(lsr)


### Name: rowCopy
### Title: Copy a vector into a matrix
### Aliases: rowCopy colCopy

### ** Examples


#### Example 1: basic usage 
data <- c(3,1,4,1,5)
rowCopy( data, 4 ) 
colCopy( data, 4 )

#### Example 2: attach dimension names
dnames <- list( rows = c("r1","r2","r3"), cols = c("c1","c2","c3","c4","c5") )
rowCopy( data,3,dnames )






