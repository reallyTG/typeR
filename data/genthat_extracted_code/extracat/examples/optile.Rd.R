library(extracat)


### Name: optile
### Title: Reordering Categorical Data
### Aliases: optile optile.list

### ** Examples


# simple simulated example
A <- arsim(2000, c(11,13),3,0.3)

fluctile(A)
fluctile(optile(A))
fluctile(optile(A, iter = 100))
fluctile(optile(A, fun = "CA"))
fluctile(optile(A, fun = "barysort", foreign = ".Call"))

# simulated mv example
A2 <- arsim(20000, c(6,7,8,9),3,0.1)

scpcp(A2,sel="data[,1]")

scpcp(A3 <- optile(A2,iter=20),sel="data[,1]")

dev.new()
fluctile(A3)

## Not run: 
##D ############ ------------ EXAMPLE I ------------ ############
##D # ----- Cluster results from the Current Population Survey ----- #
##D data(CPScluster)
##D cpsX = subtable(CPScluster,c(5, 26, 34, 38, 39), allfactor=TRUE)
##D 
##D # joint and stepwise optimization of BCC
##D ss <- optile(cpsX,presort=TRUE, return.data=TRUE, method="joint")
##D ss2 <- optile(cpsX,presort=TRUE, return.data=TRUE, method="sw")
##D 
##D # original cpcp plot
##D cpcp(cpsX)
##D 
##D # cpcp for joint algorithm
##D cpcp(ss)
##D 
##D # cpcp and fluctuation for the stepwise algorithm
##D # (should be good for pcp plots and hierarchical plots)
##D fluctile(xtabs(Freq~.,data=ss2[,-4]))
##D cpcp(ss2)
##D 
##D # The multivariate algorithm
##D ss3 <- optile(cpsX,presort=TRUE, return.data=TRUE, method=NULL)
##D cpcp(ss3)
##D 
##D # cpcp for casort algorithm
##D ssca <- optile(cpsX,presort=FALSE, fun = "casort", return.data=TRUE, method="joint")
##D cpcp(ssca)
##D 
##D # cpcp for rmca algorithm results. works better for the dmc data
##D ssR <- optile(cpsX,presort=FALSE, fun = "rmca", return.data=TRUE, method=NULL)
##D cpcp(ssR)
##D 
##D 
##D # cpcp for csvd algorithm
##D ssC <- optile(cpsX,presort=FALSE, fun = "csvd", return.data=TRUE, method=NULL)
##D fluctile(xtabs(Freq~.,data=ssC[,-4]))
##D cpcp(ssC)
##D 
##D # cpcp for presort algorithm with 20 iterations
##D ssP <- optile(cpsX,presort=FALSE, fun = "IBCC",
##D return.data=TRUE, method=NULL, foreign = ".Call",iter=20)
##D cpcp(ssP)
##D 
##D ############ ------------ EXAMPLE II ------------ ############
##D # ------------------------------- Italian wines ------------------------------ #
##D library(MMST)
##D data(wine)
##D 
##D swine <- scale(wine[,1:13])
##D kmd <- data.frame(wine$class, replicate(9, kmeans(swine, centers = 6)$cluster) )
##D kmd <- subtable(kmd, 1:10, allfactor = TRUE)
##D 
##D cpcp(kmd)
##D 
##D # there is a good joint order and hence the joint result is better than the stepwise
##D kmd2 <- optile(kmd, method = "sw")
##D kmd3 <- optile(kmd, method = "joint")
##D 
##D cpcp(kmd2)
##D cpcp(kmd3)
##D 
##D 
##D 
##D ############ ------------ EXAMPLE III ------------ ############
##D # ---------------- The BicatYeast microarray dataset  ---------------- #
##D 
##D # ----- with different clusterings for the genes ----- #
##D library(biclust)
##D data(BicatYeast)
##D 
##D Dby <- dist(BicatYeast)
##D 
##D hc1 <- hclust(Dby, method = "ward")
##D hc2 <- hclust(Dby, method = "average")
##D hc3 <- hclust(Dby, method = "complete")
##D 
##D hcc1 <- cutree(hc1, k = 6)
##D hcc2 <- cutree(hc2, k = 6)
##D hcc3 <- cutree(hc3, k = 6)
##D 
##D km1 <- kmeans(BicatYeast, centers = 6, nstart = 100, iter.max = 30)$cluster
##D 
##D library(mclust)
##D mc1 <- Mclust(BicatYeast, G = 6)$class
##D 
##D clusterings <- data.frame(hcc1,hcc2,hcc3,km1,mc1)
##D clusterings <- subtable(clusterings, 1:5, allfactor = TRUE)
##D 
##D clusterings2 <- optile(clusterings, method = "joint")
##D clusterings3 <- optile(clusterings, fun = "casort")
##D 
##D cpcp(clusterings2)
##D 
##D # a fluctuation diagram of all but the avg. clustering
##D fluctile(xtabs(Freq~.,data=clusterings2[,-2]))
##D 
##D # compute agreement via Fleiss kappa in irr:
##D require(irr)
##D rawdata <- untableSet(clusterings2)
##D for(i in 1:5) levels(rawdata[,i]) <- 1:6
##D (kappam.fleiss(rawdata))
##D (kappam.fleiss(rawdata[,-2]))
##D 
##D 
##D ## Let's have a look at kmeans with 2:12 clusters
##D library(biclust)
##D data(BicatYeast)
##D 
##D cs <- NULL
##D for(i in 2:12) cs <-  cbind(cs, kmeans(BicatYeast, centers=i,nstart=100)$cluster)
##D cs <- as.data.frame(cs)
##D names(cs) <- paste("V",2:12,sep="")
##D ocs <- optile(cs,method="joint")
##D cpcp(ocs,sort.individual=TRUE)
##D # and set alpha-blending, show.dots = TRUE
##D 
##D 
##D # and with hierarchical clusterings
##D cs2 <- NULL
##D library(amap)
##D hc <- hcluster(BicatYeast)
##D for(i in 2:20) cs2 <- cbind(cs2, subtree(hc,k=i)$data)
##D cs2 <- as.data.frame(cs2)
##D names(cs2) <- paste("V",2:20,sep="")
##D cpcp(cs2,sort.individual=TRUE)
##D # and set alpha-blending to about 0.6, show.dots = TRUE, then
##D ss <- iset()
##D ibar(ss$V6)
##D # and VIEW >> Set color (rainbow)
##D # Ideally the axes would be at a distance according to the heights of the cuts.
##D # e.g. for the first 12 clusters (after that there are some cuts at about the same height)
##D 
##D # the complete dendrogram doesn't look too attractive:
##D plot(hc)
##D 
##D # and plotting the top cuts only omits the information
##D # on how many cases are in each node or leaf
##D 
##D xcoords <- rev(tail(hc$height,11))
##D xcoords <- xcoords/max(hc$height) 
##D ycoords <- data.matrix(ss[,20:30])
##D ycoords <- apply(ycoords,2,function(s){
##D 	y <- s - min(s)
##D 	y <- y/max(y)
##D 	return(y)
##D })
##D ycoords <- cbind(ycoords, as.integer(as.matrix(ss[,5])))
##D colv <- rainbow_hcl(6)
##D dev.new()
##D par(mfrow=c(1,2))
##D plot(1,pch="", xlim=c(0,1), ylim=c(min(xcoords)-0.007,1))
##D 
##D 
##D apply(ycoords,1,function(s){
##D points(x=s[-12], y=xcoords,)
##D 	points(x=s[-12],y=xcoords,pch=19, col = colv[s[12]])
##D 	lines(x=s[-12], y=xcoords, col = colv[s[12]])
##D })
##D hc$height <- hc$height/max(hc$height)
##D plclust(subtree(hc,12),hang=0.02)
##D 
##D 
##D ############ ------------ EXAMPLE IV ------------ ############
##D # ------------------------- The Eisen Yeast data ------------------------- #
##D library(biclust)
##D data(EisenYeast)
##D SEY <- scale(EisenYeast)
##D 
##D Dby2 <- dist(SEY)
##D 
##D hc1 <- hclust(Dby2, method = "ward")
##D hc2 <- hclust(Dby2, method = "complete")
##D 
##D hcc1 <- cutree(hc1, k = 16)
##D km1 <- kmeans(scale(EisenYeast), centers = 16, nstart = 20, iter.max = 30)$cluster
##D optile( table(hcc1, km1) )
##D 
##D 
##D ############ ------------ EXAMPLE V ------------ ############
##D # ------------------------- The Bicat Yeast data ------------------------- #
##D 
##D # how many clusters are a good choice for kmeans?
##D # one possible way to find out: 
##D # compute kmeans for 100 random initial settings, sort the results (clusters) 
##D # and compute their agreement
##D # e.g. via Fleiss' Kappa (available in package irr)
##D 
##D require(biclust)
##D data(BicatYeast)
##D require(irr)
##D 
##D st <- Sys.time()
##D fk <- NULL
##D for(k in 3:8){
##D 	test <- subtable(replicate(100,kmeans(BicatYeast, centers = k)$cluster),1:100)
##D 	test <- optile(test, fun = "casort")
##D 	test <- optile(test, method="joint")
##D 	test <- untableSet(test)
##D 	for(i in 1:100) levels(test[,i]) <- 1:k
##D 	fk <- c(fk,kappam.fleiss(test)$value)
##D }
##D Sys.time()-st
##D plot(x = 3:8, y = fk, type="l", lwd=2)
##D 
##D ############ ------------ EXAMPLE VI ------------ ############
##D # ------------------------- hierarchical clustering ------------------------- #
##D 
##D # A list with hierarchical clustering objects:
##D require(amap)
##D 
##D hc1 <- hcluster(t(plants[,-1]), method="manhattan", link = "ward")
##D hc2 <- hcluster(t(plants[,-1]), method="manhattan", link = "complete")
##D 
##D hclist <- list(hc1, hc2)
##D tfluctile( optile(hclist, k= c(8,8) ) )
##D 
##D # or a table with corresponding tree objects:
##D 
##D tt <- table( subtree(hc1, 12)$data, subtree(hc2, 8)$data )
##D 
##D tfluctile(optile(tt, tree = list(hc1, hc2)))
##D 
##D # only one tree object, the other variable is free:
##D 
##D tt <- table( subtree(hc1, 8)$data, kk <- kmeans(t(plants[,-1]),centers=8)$cluster )
##D 
##D tfluctile(optile(tt, tree = list(hc1, NA)))
##D 
## End(Not run)







