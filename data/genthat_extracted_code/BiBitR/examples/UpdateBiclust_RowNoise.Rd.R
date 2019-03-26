library(BiBitR)


### Name: UpdateBiclust_RowNoise
### Title: Update a Biclust or BiBitWorkflow Object with a new Noise Level
### Aliases: UpdateBiclust_RowNoise

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
##D out <- BiBitWorkflow(matrix=mat,minr=50,minc=5,noise=0.1,cut_type="number",cut_pm=4)
##D summary(out$Biclust)
##D 
##D ## Update Rows with new noise level on Biclust Obect -> returns Biclust Object ##
##D out_new <- UpdateBiclust_RowNoise(result=out$Biclust,matrix=mat,noise=0.3)
##D summary(out_new)
##D out_new@info$Noise.Threshold # New Noise Levels
##D 
##D ## Update Rows with new noise level on BiBitWorkflow Obect -> returns BiBitWorkflow Object ##
##D out_new2 <- UpdateBiclust_RowNoise(result=out,matrix=mat,noise=0.2)
##D summary(out_new2$Biclust)
##D out_new2$info$MergedNoiseThresholds # New Noise Levels
## End(Not run)



