library(extracat)


### Name: dcorMVtable
### Title: Multivariate Distance Correlation for two sets of variables
### Aliases: dcorMVtable

### ** Examples

## Not run: 
##D 	A2 <- arsim(2000,c(8,9),5,0.1)
##D 	A2 <- optile(A2, iter=100)
##D 	BCI(A2)
##D 	wdcor(A2)
##D 	
##D 	p1 <- runif(11)+0.1
##D 	p1 <- p1/sum(p1)
##D 	A2b <- apply(A2,1:2,function(z) rmultinom(1,z,p1))
##D 	
##D 	# now the first variable is roughly independent from the other two:
##D 	
##D 	dcorMVtable(as.table(A2b),ind = 1)
##D 	
##D 	# here the third variable is NOT independent from the others:
##D 	A3 <- arsim(2000,c(8,9,11),5,0.1)
##D 	A3 <- optile(A3, iter=100)
##D 	BCI(A3)
##D 	dcorMVtable(A3,ind = 3)
##D 	
##D 	
## End(Not run)



