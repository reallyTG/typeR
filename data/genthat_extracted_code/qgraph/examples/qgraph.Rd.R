library(qgraph)


### Name: qgraph
### Title: qgraph
### Aliases: qgraph
### Keywords: Graphs qgraph Correlations

### ** Examples

## Not run: 
##D   
##D ### Correlations ###
##D # Load big5 dataset:
##D data(big5)
##D data(big5groups)
##D 
##D # Compute correlation matrix:
##D big5_cors <- cor_auto(big5, detectOrdinal = FALSE)
##D 
##D # Correlations:
##D big5Graph <- qgraph(cor(big5),minimum=0.25,groups=big5groups,
##D             legend=TRUE,borders=FALSE, title = "Big 5 correlations")
##D 
##D 
##D   # Same graph with spring layout:
##D   qgraph(big5Graph,layout="spring")
##D   
##D   # Same graph with different color scheme:
##D   qgraph(big5Graph,posCol="blue",negCol="purple")
##D  
##D   ### Network analysis ###
##D   ### Using bfi dataset from psych ###
##D   library("psych")
##D   data(bfi)
##D   
##D   # Compute correlations:
##D   CorMat <- cor_auto(bfi[,1:25])
##D   
##D   # Compute graph with tuning = 0 (BIC):
##D   BICgraph <- qgraph(CorMat, graph = "glasso", sampleSize = nrow(bfi),
##D             tuning = 0, layout = "spring", title = "BIC", details = TRUE)
##D   
##D   # Compute graph with tuning = 0.5 (EBIC)
##D   EBICgraph <- qgraph(CorMat, graph = "glasso", sampleSize = nrow(bfi),
##D             tuning = 0.5, layout = "spring", title = "BIC", details = TRUE)
##D   
##D   # Compare centrality and clustering:
##D   centralityPlot(list(BIC = BICgraph, EBIC = EBICgraph))
##D   clusteringPlot(list(BIC = BICgraph, EBIC = EBICgraph))
##D 
##D   # Compute centrality and clustering:
##D   centrality_auto(BICgraph)
##D   clustcoef_auto(BICgraph)
##D   
##D   ### Directed unweighted graphs ###
##D   set.seed(1)
##D   adj=matrix(sample(0:1,10^2,TRUE,prob=c(0.8,0.2)),nrow=10,ncol=10)
##D   qgraph(adj)
##D   title("Unweighted and directed graphs",line=2.5)
##D   
##D   # Save plot to nonsquare pdf file:
##D   qgraph(adj,filetype='pdf',height=5,width=10)
##D   
##D   #### EXAMPLES FOR EDGES UNDER DIFFERENT ARGUMENTS ###
##D   # Create edgelist:
##D   dat.3 <- matrix(c(1:15*2-1,1:15*2),,2)
##D   dat.3 <- cbind(dat.3,round(seq(-0.7,0.7,length=15),1))
##D   
##D   # Create grid layout:
##D   L.3 <- matrix(1:30,nrow=2)
##D   
##D   # Different esize:
##D   qgraph(dat.3,layout=L.3,directed=FALSE,edge.labels=TRUE,esize=14)
##D   
##D   # Different esize, strongest edges omitted (note how 0.4 edge is now 
##D   # just as wide as 0.7 edge in previous graph):
##D   qgraph(dat.3[-c(1:3,13:15),],layout=L.3,nNodes=30,directed=FALSE,
##D          edge.labels=TRUE,esize=14)
##D   
##D   # Different esize, with maximum:
##D   qgraph(dat.3,layout=L.3,directed=FALSE,edge.labels=TRUE,esize=14,maximum=1)
##D   title("maximum=1",line=2.5)
##D   
##D   qgraph(dat.3[-c(1:3,13:15),],layout=L.3,nNodes=30,directed=FALSE,edge.labels=TRUE,
##D          esize=14,maximum=1)
##D   title("maximum=1",line=2.5)
##D   
##D   # Different minimum
##D   qgraph(dat.3,layout=L.3,directed=FALSE,edge.labels=TRUE,esize=14,minimum=0.1)
##D   title("minimum=0.1",line=2.5)
##D   
##D   # With cutoff score:
##D   qgraph(dat.3,layout=L.3,directed=FALSE,edge.labels=TRUE,esize=14,cut=0.4)
##D   title("cut=0.4",line=2.5)
##D   
##D   # With details:
##D   qgraph(dat.3,layout=L.3,directed=FALSE,edge.labels=TRUE,esize=14,minimum=0.1,
##D          maximum=1,cut=0.4,details=TRUE)
##D   title("details=TRUE",line=2.5)
##D   
##D   
##D   # Trivial example of manually specifying edge color and widths:
##D   E <- as.matrix(data.frame(from=rep(1:3,each=3),to=rep(1:3,3),width=1:9))
##D   qgraph(E,mode="direct",edge.color=rainbow(9))
##D   
##D   
##D   ### Input based on other R objects ###
##D   
##D   ## Exploratory factor analysis:
##D   big5efa <- factanal(big5,factors=5,rotation="promax",scores="regression")
##D   qgraph(big5efa,groups=big5groups,layout="circle",minimum=0.2,
##D          cut=0.4,vsize=c(1.5,10),borders=FALSE,vTrans=200,title="Big 5 EFA")
##D   
##D   ## Principal component analysis:
##D   library("psych")
##D   big5pca <- principal(cor(big5),5,rotate="promax")
##D   qgraph(big5pca,groups=big5groups,layout="circle",rotation="promax",minimum=0.2,
##D          cut=0.4,vsize=c(1.5,10),borders=FALSE,vTrans=200,title="Big 5 PCA")
##D   
##D   ## pcalg
##D   # Example from pcalg vignette:
##D   library("pcalg")
##D   data(gmI)
##D   suffStat <- list(C = cor(gmI$x), n = nrow(gmI$x))
##D   pc.fit <- pc(suffStat, indepTest=gaussCItest,
##D                p = ncol(gmI$x), alpha = 0.01)
##D   
##D   qgraph(pc.fit)
##D   
##D   ## glasso:
##D   # Using bfi dataset from psych:
##D   library("psych")
##D   data(bfi)
##D   cor_bfi <- cor_auto(bfi[,1:25])
##D   
##D   # Run qgraph:
##D   library("glasso")
##D   bfi_glasso <- glasso(cor_bfi, 0.1)
##D   
##D   # Plot:
##D   qgraph(bfi_glasso, layout = "spring")
##D   
## End(Not run)




