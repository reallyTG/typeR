library(spaMM)


### Name: adjlg
### Title: Simulated data set for testing sparse-precision code
### Aliases: adjlg adjlgMat
### Keywords: datasets

### ** Examples

data(adjlg)
## See further usage in tests/test-adjacency-long.R
## Not run: 
##D # as produced by:
##D   library(data.table) ## Included data produced using version 1.10.4.3
##D   library(igraph) ## Included data produced using version 1.2.1
##D   
##D   rsample <- function(N=100, ## size of implied adjacency matrix
##D                       month_max=10,seed) {
##D     if (is.integer(seed)) set.seed(seed)
##D     dt <- data.table(ID=factor(1:N))
##D     dt$months <- sample(1:month_max,N,replace=T) ## # of liens for each level of ID
##D     dt$GENDER <- sample(c("MALE","FEMALE"),N,replace=TRUE)
##D     dt$AGE <- sample(18:99,N,replace=T)
##D     dt$X1 <- sample(1000:9900,N,replace=T)
##D     dt$X2 <-  runif(N)
##D     
##D     dt <- dt[, c(.SD, month=data.table(seq(from=1, to=months, by = 1))), by = ID] 
##D     dt[,BUY := 0]
##D     dt[month.V1==months,BUY := sample(c(0,1),1),by=ID]
##D     setnames(dt,"month.V1","month")
##D     
##D     #### create adjacency matrix
##D     Network <- data.table(OUT=sample(dt$ID,N*month_max*4/10))
##D     Network$IN <- sample(dt$ID,N*month_max*4/10)
##D     Network <- Network[IN != OUT]
##D     Network <- unique(Network)
##D     g <- graph.data.frame(Network,directed=F)
##D     g <- add_vertices(g,sum(!unique(dt$ID) %in% V(g)),name=unique(dt[!dt$ID %in% V(g),list(ID)]))
##D     Network <- as_adjacency_matrix(g,sparse = TRUE,type="both")
##D     return(list(data=dt,adjMatrix=Network))
##D   }
##D 
##D   set.seed(123)
##D   adjlg_sam <- rsample(N=1000,seed=NULL) 
##D   adjlg <- as.data.frame(adjlg_sam$data)
##D   adjlgMat <- adjlg_sam$adjMatrix
## End(Not run)



