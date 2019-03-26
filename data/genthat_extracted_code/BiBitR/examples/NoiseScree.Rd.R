library(BiBitR)


### Name: NoiseScree
### Title: Noise Scree Plots
### Aliases: NoiseScree

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
##D # Make Noise Scree Plot - Default
##D NoiseScree(result=out,matrix=mat,type="Added")
##D NoiseScree(result=out,matrix=mat,type="Total")
##D # Make Noise Scree Plot - Use Automatic Noies Selection
##D NoiseScree(result=out,matrix=mat,type="Added",noise_select=2)
##D NoiseScree(result=out,matrix=mat,type="Total",noise_select=2)
##D 
##D ## Apply RowTest_Fisher on BiBitWorkflow Object ##
##D out2 <- RowTest_Fisher(result=out,matrix=mat)
##D # Fisher output is added to "NoiseScree" plot
##D NoiseScree(result=out2,matrix=mat,type="Added")
##D NoiseScree(result=out2,matrix=mat,type="Total")
## End(Not run)



