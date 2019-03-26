library(MultiLCIRT)


### Name: class_item
### Title: Hierarchical classification of test items
### Aliases: class_item
### Keywords: classification

### ** Examples

## Not run: 
##D ## Model-based hierarchical classification of items from simulated data
##D # Setup
##D r = 6  # number of items
##D n = 1000  # sample size
##D bev = rep(0,r) 
##D k = r/2
##D multi = rbind(1:(r/2),(r/2+1):r)
##D L = chol(matrix(c(1,0.6,0.6,1),2,2))
##D data = matrix(0,n,r)
##D model = 1 
##D # Create data
##D Th = matrix(rnorm(2*n),n,2)##D 
##D for(i in 1:n) for(j in 1:r){
##D 	if(j<=r/2){
##D     	pc = exp(Th[i,1]-bev[j]); pc = pc/(1+pc)
##D 	}else{
##D 		pc = exp(Th[i,2]-bev[j]); pc = pc/(1+pc)
##D     }
##D     data[i,j] = runif(1)<pc
##D }
##D # Aggregate data
##D out = aggr_data(data)
##D S = out$data_dis
##D yv = out$freq
##D # Create dendrogram for items classification, by assuming k=3 latent
##D # classes and a Rasch parameterization
##D out = class_item(S,yv,k=3,link=1)
##D summary(out)
##D plot(out$dend)
## End(Not run)

## Not run: 
##D ## Model-based hierarchical classification of NAEP items
##D # Aggregate data
##D data(naep)
##D X = as.matrix(naep)
##D out = aggr_data(X)
##D S = out$data_dis
##D yv = out$freq
##D # Create dendrogram for items classification, by assuming k=4 latent
##D # classes and a Rasch parameterization
##D out = class_item(S,yv,k=4,link=1)   
##D summary(out)
##D plot(out$dend)
## End(Not run)



