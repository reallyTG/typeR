library(BiBitR)


### Name: BiBitWorkflow
### Title: BiBit Workflow
### Aliases: BiBitWorkflow

### ** Examples

## Not run: 
##D ## Simulate Data ##
##D # DATA: 10000x50
##D # BC1: 200x10
##D # BC2: 100x10
##D # BC1 and BC2 overlap 5 columns
##D 
##D # BC3: 200x10
##D # BC4: 100x10
##D # BC3 and bC4 overlap 2 columns
##D 
##D # Background 1 percentage: 0.15
##D # BC Signal Percentage: 0.9
##D  
##D set.seed(273)
##D mat <- matrix(sample(c(0,1),10000*50,replace=TRUE,prob=c(1-0.15,0.15)),
##D               nrow=10000,ncol=50)
##D mat[1:200,1:10] <- matrix(sample(c(0,1),200*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                           nrow=200,ncol=10)
##D mat[300:399,6:15] <- matrix(sample(c(0,1),100*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                             nrow=100,ncol=10)
##D mat[400:599,21:30] <- matrix(sample(c(0,1),200*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                              nrow=200,ncol=10)
##D mat[700:799,29:38] <- matrix(sample(c(0,1),100*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                              nrow=100,ncol=10)
##D mat <- mat[sample(1:10000,10000,replace=FALSE),sample(1:50,50,replace=FALSE)]
##D 
##D 
##D # Computing gap statistic for initial 1381 BC takes approx. 15 min.
##D # Gap Statistic chooses 4 clusters. 
##D out <- BiBitWorkflow(matrix=mat,minr=50,minc=5,noise=0.2) 
##D summary(out$Biclust)
##D 
##D # Reduce computation by selecting number of clusters manually.
##D # Note: The "ClusterRowCoverage" function can be used to provided extra info 
##D #       on the number of cluster choice.
##D #       How?
##D #       - More clusters result in smaller column patterns and more matching rows.
##D #       - Less clusters result in larger column patterns and less matching rows.
##D # Step 1: Initial Workflow Run
##D out2 <- BiBitWorkflow(matrix=mat,minr=50,minc=5,noise=0.2,cut_type="number",cut_pm=10)
##D # Step 2: Use ClusterRowCoverage
##D temp <- ClusterRowCoverage(result=out2,matrix=mat,noise=0.2,plots=2)
##D # Step 3: Use BiBitWorkflow again (using previously computed parts) with new cut parameter
##D out3 <- BiBitWorkflow(matrix=mat,minr=50,minc=5,noise=0.2,cut_type="number",cut_pm=4,
##D                       BCresult = out2$info$BiclustInitial,
##D                       simmatresult = out2$info$BiclustSimInitial)
##D summary(out3$Biclust)
## End(Not run)



