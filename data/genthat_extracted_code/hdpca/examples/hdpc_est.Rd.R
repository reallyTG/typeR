library(hdpca)


### Name: hdpc_est
### Title: High-dimensional PCA estimation
### Aliases: hdpc_est
### Keywords: multivariate optimize

### ** Examples

data(Example)
#n = 198, p = 75435 for this data

####################################################
## Not run: 
##D m<-select.nspike(train.eval,p,n,n.spikes.max=10,evals.out=FALSE)$n.spikes
##D out<-hdpc_est(train.eval, p, n, method = "d.gsp", 
##D n.spikes=m, n.spikes.out=2, nonspikes.out = FALSE)	#Output 2 spikes, no non-spike
##D 
##D out<-hdpc_est(train.eval, p, n, method = "l.gsp", 
##D n.spikes=m, nonspikes.out = FALSE)	#Output m many spikes, no non-spike
##D 
##D out<-hdpc_est(train.eval, p, n, method = "l.gsp", 
##D n.spikes.max=10, nonspikes.out = TRUE)	#Output all eigenvalues
##D 
##D out<-hdpc_est(train.eval, p, n, method = "osp", 
##D n.spikes=m, n.spikes.out=2, nonspikes.out = TRUE)	#Output m many spikes, no non-spike
## End(Not run)



