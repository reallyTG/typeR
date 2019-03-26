library(igraph)


### Name: scg_group
### Title: SCG Problem Solver
### Aliases: scg_group scgGrouping
### Keywords: graphs

### ** Examples



## We are not running these examples any more, because they
## take a long time to run and this is against the CRAN repository
## policy. Copy and paste them by hand to your R prompt if
## you want to run them.

## Not run: 
##D # eigenvectors of a random symmetric matrix
##D M <- matrix(rexp(10^6), 10^3, 10^3)
##D M <- (M + t(M))/2
##D V <- eigen(M, symmetric=TRUE)$vectors[,c(1,2)]
##D 
##D # displays size of the groups in the final partition
##D gr <- scg_group(V, nt=c(2,3))
##D col <- rainbow(max(gr))
##D plot(table(gr), col=col, main="Group size", xlab="group", ylab="size")
##D 
##D ## comparison with the grouping obtained by kmeans
##D ## for a partition of same size
##D gr.km <- kmeans(V,centers=max(gr), iter.max=100, nstart=100)$cluster
##D op <- par(mfrow=c(1,2))
##D plot(V[,1], V[,2], col=col[gr],
##D 	main = "SCG grouping",
##D 	xlab = "1st eigenvector",
##D 	ylab = "2nd eigenvector")
##D plot(V[,1], V[,2], col=col[gr.km],
##D 	main = "K-means grouping",
##D 	xlab = "1st eigenvector",
##D 	ylab = "2nd eigenvector")
##D par(op)
##D ## kmeans disregards the first eigenvector as it
##D ## spreads a much smaller range of values than the second one
##D 
##D ### comparing optimal and k-means solutions
##D ### in the one-dimensional case.
##D x <- rexp(2000, 2)
##D gr.true <- scg_group(cbind(x), 100)
##D gr.km <- kmeans(x, 100, 100, 300)$cluster
##D scg_eps(cbind(x), gr.true)
##D scg_eps(cbind(x), gr.km)
## End(Not run)




