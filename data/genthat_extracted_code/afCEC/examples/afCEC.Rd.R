library(afCEC)


### Name: afCEC
### Title: afCEC
### Aliases: afCEC

### ** Examples

	## Don't show: 
		library(afCEC);
		data(dog);
		res<-afCEC(dog,5,numberOfStarts=1);
	
## End(Don't show)
	## Not run: 
##D 		# The following two examples demonstrate two equivalent ways of passing the same
##D 		# 3D quadratic active function to the afCEC routine:
##D 		
##D 		# 1) Using "quadratic" value (default):
##D 		
##D 		library(afCEC);
##D 		data(airplane);
##D 		result <- afCEC(airplane, 17);
##D 		
##D 		# what is equivalent to:
##D 		
##D 		library(afCEC);
##D 		data(airplane);
##D 		result <- afCEC(airplane, 17, values="quadratic");
##D 		
##D 		# 2) Using the matrix containing the explicit values of the active function
##D 		#    across the subsequent dimensions:
##D 		
##D 		library(afCEC);
##D 		data(airplane);
##D 		values = matrix(rep(0, 5*3*dim(airplane)[1]), 5*3, dim(airplane)[1]);
##D 		for (i in 1:dim(airplane)[1]) {
##D 			tmp <- airplane[i,2:3];
##D 			for (j in 1:3) {
##D 				values[((j - 1) * 5) + 1, i] <- tmp[1]^2;
##D 				values[((j - 1) * 5) + 2, i] <- tmp[2]^2;
##D 				values[((j - 1) * 5) + 3, i] <- tmp[1];
##D 				values[((j - 1) * 5) + 4, i] <- tmp[2];
##D 				values[((j - 1) * 5) + 5, i] <- 1;
##D 				if (j < 3) tmp[j] <- airplane[i,j];
##D 			}
##D 		}
##D 		result <- afCEC(airplane, 17, values=values);
##D 	
## End(Not run)



