library(NetworkChange)


### Name: Kmeans
### Title: Contour plot of latent node positions
### Aliases: Kmeans

### ** Examples


   ## Not run: 
##D set.seed(1973)
##D     ## generate an array with three blocks
##D set.seed(11173)
##D 
##D ## The number of node in each block is
##D N <- 5
##D 
##D ## Generate block-splitting network time series data
##D Yarr <- MakeBlockNetworkChange(n=N, break.point = .5,
##D         base.prob=.05, block.prob=.5, shape=1, T=20, type ="split")
##D 
##D ## Pick is a homophily network with 3 blocks
##D Y1 <- Yarr[,,16]
##D 
##D ## Y2 is a mirror image of Y1, which is heterophilous
##D Y2 <- 1-Yarr[,,20]
##D diag(Y2) <- 0
##D 
##D ## Combine them into a multilayer network array
##D Y <- abind(Y1, Y2, along=3)
##D 
##D G <- 100 ## Small mcmc scans to save time
##D out0 <- NetworkStatic(Y, R=2,  mcmc = G, burnin = G,
##D         constant=FALSE, verbose= G, degree.normal="eigen")
##D plot3 <- Kmeans(out0, n.cluster=3, main="(C) Recovered Three Blocks")
##D 
##D require (sna)
##D g1 <- network(Y[,,1], directed = FALSE)
##D g2 <- network(Y[,,2], directed = FALSE)
##D 
##D require(ggnet)
##D plot1 <- ggnet2(g1, node.size = 4, label.size=3,
##D     label = plot3$data$names, color = rep(c("red", "green", "blue"), each=N),
##D     label.color = "white", alpha = 0.5) + ggtitle("(A) Network Layer 1")
##D plot2 <- ggnet2(g2, node.size = 4, label.size=3,
##D     label = plot3$data$names, color = rep(c("red", "green", "blue"), each=N),
##D     label.color = "white", alpha = 0.5) + ggtitle("(B) Network Layer 2")
##D multiplot(plot1, plot2, plot3, cols=3)
##D 
## End(Not run)



