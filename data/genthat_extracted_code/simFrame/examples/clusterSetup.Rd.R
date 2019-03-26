library(simFrame)


### Name: clusterSetup
### Title: Set up multiple samples on a cluster
### Aliases: clusterSetup clusterSetup-methods
###   clusterSetup,ANY,data.frame,character-method
###   clusterSetup,ANY,data.frame,missing-method
###   clusterSetup,ANY,data.frame,SampleControl-method
###   clusterSetup,ANY,data.frame,TwoStageControl-method clustersetup
###   ClusterSetup Clustersetup
### Keywords: distribution methods

### ** Examples

## Not run: 
##D # these examples require at least a dual core processor
##D 
##D # load data
##D data(eusilcP)
##D 
##D # start cluster
##D cl <- makeCluster(2, type = "PSOCK")
##D 
##D # load package and data on workers
##D clusterEvalQ(cl, {
##D         library(simFrame)
##D         data(eusilcP)
##D     })
##D 
##D # set up random number stream
##D clusterSetRNGStream(cl, iseed = "12345")
##D 
##D # simple random sampling
##D srss <- clusterSetup(cl, eusilcP, size = 20, k = 4)
##D summary(srss)
##D draw(eusilcP[, c("id", "eqIncome")], srss, i = 1)
##D 
##D # group sampling
##D gss <- clusterSetup(cl, eusilcP, grouping = "hid", size = 10, k = 4)
##D summary(gss)
##D draw(eusilcP[, c("hid", "id", "eqIncome")], gss, i = 2)
##D 
##D # stratified simple random sampling
##D ssrss <- clusterSetup(cl, eusilcP, design = "region", 
##D     size = c(2, 5, 5, 3, 4, 5, 3, 5, 2), k = 4)
##D summary(ssrss)
##D draw(eusilcP[, c("id", "region", "eqIncome")], ssrss, i = 3)
##D 
##D # stratified group sampling
##D sgss <- clusterSetup(cl, eusilcP, design = "region", 
##D     grouping = "hid", size = c(2, 5, 5, 3, 4, 5, 3, 5, 2), k = 4)
##D summary(sgss)
##D draw(eusilcP[, c("hid", "id", "region", "eqIncome")], sgss, i = 4)
##D 
##D # stop cluster
##D stopCluster(cl)
## End(Not run)



