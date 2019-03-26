library(isa2)


### Name: isa
### Title: Iterative Signature Algorithm
### Aliases: isa isa,matrix-method
### Keywords: cluster

### ** Examples

## Not run: 
##D ## We generate some noisy in-silico data with modules and try to find
##D ## them with the ISA. This might take one or two minutes.
##D data <- isa.in.silico(noise=0.1)
##D isa.result <- isa(data[[1]])
##D 
##D ## Find the best bicluster for each block in the input
##D best <- apply(cor(isa.result$rows, data[[2]]), 2, which.max)
##D 
##D ## Check correlation
##D sapply(seq_along(best),
##D        function(x) cor(isa.result$rows[,best[x]], data[[2]][,x]))
##D 
##D ## The same for the columns
##D sapply(seq_along(best),
##D        function(x) cor(isa.result$columns[,best[x]], data[[3]][,x]))
##D 
##D ## Plot the data and the modules found
##D if (interactive()) {
##D   layout(rbind(1:2,3:4))
##D   image(data[[1]], main="In-silico data")
##D   sapply(best, function(b) image(outer(isa.result$rows[,b],
##D                                        isa.result$columns[,b]),
##D                                  main=paste("Module", b)))  
##D }
## End(Not run)



