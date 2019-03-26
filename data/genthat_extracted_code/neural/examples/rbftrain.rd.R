library(neural)


### Name: rbftrain
### Title: RBF neural network
### Aliases: rbftrain
### Keywords: neural

### ** Examples


	x<-t(matrix(-5:10*24,1,16));
	y<-t(matrix(sin(pi/180*(-5:10*24)),1,16));
	neurons<-8;
	## Not run: 
##D 	data<-rbftrain(x,neurons,y,sigma=NaN)
##D 	rbf(x,data$weight,data$dist,data$neurons,data$sigma)
##D 	
## End(Not run)



