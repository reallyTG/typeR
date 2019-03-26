library(pivmet)


### Name: piv_KMeans
### Title: k-means Clustering Using Pivotal Algorithms For Seeding
### Aliases: piv_KMeans

### ** Examples


# Data generated from a mixture of three bivariate Gaussian distributions
## Not run: 
##D N  <- 620
##D k  <- 3
##D n1 <- 20
##D n2 <- 100
##D n3 <- 500
##D x  <- matrix(NA, N,2)
##D truegroup <- c( rep(1,n1), rep(2, n2), rep(3, n3))
##D 
##D for (i in 1:n1){
##D  x[i,]=rmvnorm(1, c(1,5), sigma=diag(2))}
##D for (i in 1:n2){
##D  x[n1+i,]=rmvnorm(1, c(4,0), sigma=diag(2))}
##D for (i in 1:n3){
##D  x[n1+n2+i,]=rmvnorm(1, c(6,6), sigma=diag(2))}
##D 
##D # Apply piv_KMeans with MUS as pivotal criterion
##D 
##D res <- piv_KMeans(x, k)
##D 
##D # Apply piv_KMeans with maxsumdiff as pivotal criterion
##D 
##D res2 <- piv_KMeans(x, k, piv.criterion ="maxsumdiff")
##D 
##D # Plot the data and the clustering solution
##D 
##D par(mfrow=c(1,2), pty="s")
##D colors_cluster <- c("grey", "darkolivegreen3", "coral")
##D colors_centers <- c("black", "darkgreen", "firebrick")
##D plot(x, col = colors_cluster[truegroup],
##D    bg= colors_cluster[truegroup], pch=21, xlab="x[,1]",
##D    ylab="x[,2]", cex.lab=1.5,
##D    main="True data", cex.main=1.5)
##D 
##D plot(x, col = colors_cluster[res$cluster],
##D    bg=colors_cluster[res$cluster], pch=21, xlab="x[,1]",
##D    ylab="x[,2]", cex.lab=1.5,
##D    main="piv_KMeans", cex.main=1.5)
##D points(x[res$pivots[1],1], x[res$pivots[1],2],
##D    pch=24, col=colors_centers[1],bg=colors_centers[1],
##D    cex=1.5)
##D points(x[res$pivots[2],1], x[res$pivots[2],2],
##D    pch=24,  col=colors_centers[2], bg=colors_centers[2],
##D    cex=1.5)
##D points(x[res$pivots[3],1], x[res$pivots[3],2],
##D    pch=24, col=colors_centers[3], bg=colors_centers[3],
##D    cex=1.5)
##D points(res$centers, col = colors_centers[1:k],
##D    pch = 8, cex = 2)
##D    
## End(Not run)



