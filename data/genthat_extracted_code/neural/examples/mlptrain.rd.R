library(neural)


### Name: mlptrain
### Title: MLP neural network
### Aliases: mlptrain
### Keywords: neural

### ** Examples

	x<-matrix(c(1,1,0,0,1,0,1,0),4,2)
	y<-matrix(c(0,1,1,0),4,1)
	neurons<-4
	## Not run: 
##D 	data<-mlptrain(x,neurons,y,it=4000);
##D 	mlp(x,data$weight,data$dist,data$neurons,data$actfns)
##D 	
## End(Not run)



