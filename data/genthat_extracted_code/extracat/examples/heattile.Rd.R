library(extracat)


### Name: heattile
### Title: Heatmap with Biclusters
### Aliases: heattile

### ** Examples






## Not run: 
##D 
##D ss <- sample(1:nrow(plants), 500)
##D M <- t(as.matrix(plants[ ss, -1]))
##D M <- optME(M)
##D heattile(M, hm.palette = "seq")
##D 
##D 	require(biclust)
##D 	
##D 	GE <- t(na.omit(GeneEx[,3:52]))
##D  
##D  	# draw a sample of 1000 genes
##D 	ss <- sample(1:ncol(GE),1000)
##D 
##D 	EY <- GE[,ss]
##D 	SEY <- scale(EY)
##D 
##D 	# compute sensible initial row and column orders:
##D 	require(seriation)
##D 	s1 <- seriate(dist(SEY),method="GW")
##D 	s2 <- seriate(dist(t(SEY)),method="GW")
##D 
##D 	o1 <- get_order(s1,1)
##D 	o2 <- get_order(s2,1)
##D 
##D 	SEY <- SEY[o1,o2]
##D 	
##D 	# A plaid model with row effects
##D 	b1 <- biclust(SEY,method=BCPlaid(),row.release=0.4,
##D 	 col.release=0.4, fit.model = y ~ m + a )
##D 
##D 	# index sets from b1
##D 	Is2 <- getIs(b1,dim(SEY), nstart = 1)
##D 
##D 	# clusters in seriated matirx:
##D 	heattile(SEY,biclust=b1,clust.palette="hsv",hm.palette="div",
##D 	 label = TRUE, border = c(0.1,0.01,0.03,0.03))
##D 
##D 	#clusters in optimized matrix
##D 	heattile(SEY,Is=Is2,clust.palette="hsv",hm.palette="div",
##D 	 label = TRUE, border = c(0.1,0.01,0.03,0.03))
## End(Not run)





