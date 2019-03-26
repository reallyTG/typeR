library(lolog)


### Name: lologPackageSkeleton
### Title: Create a skeleton for a package extending lolog
### Aliases: lologPackageSkeleton

### ** Examples


## Not run: 
##D 
##D #install package
##D lologPackageSkeleton()
##D system("R CMD build LologExtension")
##D system("R CMD INSTALL LologExtension_1.0.tar.gz")
##D 
##D library(LologExtension) #Load package
##D 
##D # Run model with new minDegree statistic
##D library(network)
##D m <- matrix(0,20,20)
##D for(i in 1:19) for(j in (i+1):20) m[i,j] <- m[j,i] <- rbinom(1,1,.1)
##D g <- network(m, directed=FALSE)
##D fit <- lologVariational(g ~ edges() + minDegree(1L))
##D summary(fit)
##D 
## End(Not run)



