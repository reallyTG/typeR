library(asbio)


### Name: rmvm
### Title: A multivariate normal dataset for data mining
### Aliases: rmvm
### Keywords: datasets

### ** Examples

## Code used to create data
## Not run: 
##D sigma <- matrix(nrow = 15, ncol = 15, 0)
##D diag(sigma) = 1
##D mvn <- rmvnorm(n=500, mean=rnorm(15), sigma=sigma)
##D Y <- mvn[,1] + mvn[,2] + mvn[,3] + mvn[,4] + mvn[,4] + mvn[,5] + mvn[,6] + mvn[,7] +
##D mvn[,8] + mvn[,9] + mvn[,10] + mvn[,11] + mvn[,12] + mvn[,13] + mvn[,14] + mvn[15] + rnorm(500)
##D rmvm <- data.frame(cbind(Y, mvn))
##D names(rmvm) <- c("Y", paste("X", 1:15, sep = ""))
## End(Not run)



