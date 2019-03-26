library(RNOmni)


### Name: OINT
### Title: Omnibus-INT
### Aliases: OINT

### ** Examples

## Not run: 
##D set.seed(100);
##D # Design matrix
##D X = cbind(1,rnorm(1e3));
##D # Genotypes
##D G = replicate(1e3,rbinom(n=1e3,size=2,prob=0.25));
##D storage.mode(G) = "numeric";
##D # Phenotype
##D y = exp(as.numeric(X%*%c(1,1))+rnorm(1e3));
##D # Average correlation
##D p = OINT(y=y,G=G,X=X,method="AvgCorr");
##D # Bootstrap correlation
##D p = OINT(y=y,G=G[,1:10],X=X,method="Bootstrap",B=100);
##D # Manual correlation
##D p = OINT(y=y,G=G,X=X,method="Manual",set.rho=0.5);
## End(Not run)



