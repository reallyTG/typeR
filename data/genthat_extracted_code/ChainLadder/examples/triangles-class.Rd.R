library(ChainLadder)


### Name: triangles-class
### Title: S4 Class "triangles"
### Aliases: triangles-class [,triangles,missing,numeric,logical-method
###   [,triangles,missing,numeric,missing-method
###   [,triangles,numeric,missing,logical-method
###   [,triangles,numeric,missing,missing-method
###   [,triangles,numeric,numeric,missing-method
###   [<-,triangles,numeric,numeric,list-method
###   coerce,list,triangles-method dim,triangles-method
###   cbind2,triangles,missing-method rbind2,triangles,missing-method
### Keywords: classes

### ** Examples

data(auto)

# "coerce"
auto <- as(auto,"triangles")  # transform "list" to be "triangles"

# method for "["
auto[,4:6,drop=FALSE] # rows of all NA's not dropped
auto[,4:6]			# drop rows of all NA's

auto[8:10, ,drop=FALSE] #columns of all NA's not dropped
auto[8:10, ] 			#columns of all NA's  dropped

auto[1:2,1]

# replacement method
auto[1:2,1] <- list(1,2,3)
auto[1,2]
   
dim(auto)

cbind2(auto[1:2,1])
rbind2(auto[1:2,1])



