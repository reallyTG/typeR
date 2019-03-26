library(sdef)


### Name: designCount
### Title: Internal function
### Aliases: designCount

### ** Examples


## The function is currently defined as
function(array,design) {

sum1intersects <- function(c1,c2) return(all(c1 == c2))
res <- vector(mode="numeric",length=(nrow(design)-1))

for(i in 2:nrow(design)){
res[i-1] <- sum(apply(array,1,sum1intersects,design[i,]))
  }
return(res)
  }



