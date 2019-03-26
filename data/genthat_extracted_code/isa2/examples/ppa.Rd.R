library(isa2)


### Name: ppa
### Title: The Ping-Pong Algorithm
### Aliases: ppa ppa,list-method
### Keywords: cluster

### ** Examples

## WE do not run this, it takes relatively long
## Not run: 
##D data <- ppa.in.silico(noise=0.1)
##D ppa.result <- ppa(data[1:2], direction="up")
##D 
##D ## Find the best bicluster for each block in the input
##D ## (based on the rows of the first input matrix)
##D best <- apply(cor(ppa.result$rows1, data[[3]]), 2, which.max)
##D 
##D ## Check correlation
##D sapply(seq_along(best),
##D        function(x) cor(ppa.result$rows1[,best[x]], data[[3]][,x]))
##D 
##D ## The same for the rows of the second matrix
##D sapply(seq_along(best),
##D        function(x) cor(ppa.result$rows2[,best[x]], data[[4]][,x]))
##D 
##D ## The same for the columns
##D sapply(seq_along(best),
##D        function(x) cor(ppa.result$columns[,best[x]], data[[5]][,x]))
##D 
##D ## Plot the data and the modules found
##D if (interactive()) {
##D   layout(rbind(1:2,c(3,6),c(4,7), c(5,8)))
##D   image(data[[1]], main="In-silico data, first matrix")
##D   image(data[[2]], main="In-silico data, second matrix")
##D   sapply(best[1:3], function(b) image(outer(ppa.result$rows1[,b],
##D                                        ppa.result$columns[,b]),
##D                                  main=paste("Module", b)))  
##D   sapply(best[1:3], function(b) image(outer(ppa.result$rows2[,b],
##D                                        ppa.result$columns[,b]),
##D                                  main=paste("Module", b)))  
##D }
## End(Not run)



