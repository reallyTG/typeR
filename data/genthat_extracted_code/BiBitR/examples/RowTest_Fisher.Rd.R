library(BiBitR)


### Name: RowTest_Fisher
### Title: Apply Fisher Exact Test on Bicluster Rows
### Aliases: RowTest_Fisher

### ** Examples

## Not run: 
##D ## Prepare some data ##
##D set.seed(254)
##D mat <- matrix(sample(c(0,1),5000*50,replace=TRUE,prob=c(1-0.15,0.15)),
##D               nrow=5000,ncol=50)
##D mat[1:200,1:10] <- matrix(sample(c(0,1),200*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                           nrow=200,ncol=10)
##D mat[300:399,6:15] <- matrix(sample(c(0,1),100*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                             nrow=100,ncol=10)
##D mat[400:599,21:30] <- matrix(sample(c(0,1),200*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                              nrow=200,ncol=10)
##D mat[700:799,29:38] <- matrix(sample(c(0,1),100*10,replace=TRUE,prob=c(1-0.9,0.9)),
##D                              nrow=100,ncol=10)
##D mat <- mat[sample(1:5000,5000,replace=FALSE),sample(1:50,50,replace=FALSE)]
##D 
##D ## Apply BiBitWorkflow ##
##D out <- BiBitWorkflow(matrix=mat,minr=50,minc=5,noise=0.2,cut_type="number",cut_pm=4)
##D 
##D ## Apply RowTest_Fisher on Biclust Object -> returns Biclust Object ##
##D out_new <- RowTest_Fisher(result=out$Biclust,matrix=mat)
##D # FisherResult output in info slot
##D str(out_new@info$FisherResult)
##D # FisherInfo output in info slot (comparison with original BC's)
##D str(out_new@info$FisherInfo)
##D 
##D 
##D ## Apply RowTest_Fisher on BiBitWorkflow Object -> returns BiBitWorkflow Object ##
##D out_new2 <- RowTest_Fisher(result=out,matrix=mat)
##D # FisherResult output in BiBitWorkflow info element
##D str(out_new2$info$FisherResult)
##D # Fisher output is added to "NoiseScree" plot
##D NoiseScree(result=out_new2,matrix=mat,type="Added")
## End(Not run)



