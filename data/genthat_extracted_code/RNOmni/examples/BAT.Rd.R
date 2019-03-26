library(RNOmni)


### Name: BAT
### Title: Basic Association Test
### Aliases: BAT

### ** Examples

## Not run: 
##D set.seed(100);
##D # Design matrix
##D X = cbind(1,rnorm(1e3));
##D # Genotypes
##D G = replicate(1e3,rbinom(n=1e3,size=2,prob=0.25));
##D storage.mode(G) = "numeric";
##D # Phenotype
##D y = as.numeric(X%*%c(1,1))+rnorm(1e3);
##D # Association test
##D p = BAT(y=y,G=G,X=X,simple=T);
## End(Not run)



