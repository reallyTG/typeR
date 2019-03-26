library(lolog)


### Name: [
### Title: indexing
### Aliases: [ [,Rcpp_DirectedNet-method
###   [,Rcpp_DirectedNet,ANY,ANY,ANY-method
###   \S4method{[}{Rcpp_DirectedNet,ANY,ANY,ANY} [
###   [,Rcpp_UndirectedNet-method [,Rcpp_UndirectedNet,ANY,ANY,ANY-method
###   \S4method{[}{Rcpp_UndirectedNet,ANY,ANY,ANY} [<-
###   [<-,Rcpp_DirectedNet-method [<-,Rcpp_DirectedNet,ANY,ANY,ANY-method
###   \S4method{[<-}{Rcpp_DirectedNet,ANY,ANY,ANY} [<-
###   [<-,Rcpp_UndirectedNet-method
###   [<-,Rcpp_UndirectedNet,ANY,ANY,ANY-method
###   \S4method{[<-}{Rcpp_UndirectedNet,ANY,ANY,ANY}

### ** Examples

data(ukFaculty)
net <- as.BinaryNet(ukFaculty)


#dyad Extraction
net[1:2,1:5]
net$outNeighbors(c(1,2,3))

#dyad assignment
net[1,1:5] <- rep(NA,5)
net[1:2,1:5]
net[1:2,1:5,maskMissing=FALSE] #remove the mask over missing values and see
#nothing was really changed

#node variables
net$variableNames()
net[["Group"]]
net[["rnorm"]] <- rnorm(net$size())
net[["rnorm"]]



