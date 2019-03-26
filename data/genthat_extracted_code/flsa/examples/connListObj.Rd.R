library(flsa)


### Name: is.connListObj
### Title: Connection List Objects
### Aliases: ConnListObj is.connListObj connListObj
### Keywords: regression multivariate

### ** Examples


connList <- vector("list", 4)
y <- 1:4

class(connList) = "connListObj"
connList[[1]] = as.integer(c(1,2))
connList[[2]] = as.integer(c(0,3))
connList[[3]] = as.integer(c(3,0))
connList[[4]] = as.integer(c(2,1))
names(connList) <- as.character(0:3) ## not necessary, just for illustration

res <- flsa(y, connListObj=connList)
res2 <- flsa(matrix(y, nrow=2))

res$BeginLambda
res2$BeginLambda
flsaGetSolution(res, lambda2=c(0, 0.5, 1))
flsaGetSolution(res2, lambda2=c(0, 0.5, 1))



