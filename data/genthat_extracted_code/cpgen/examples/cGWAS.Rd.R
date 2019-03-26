library(cpgen)


### Name: cGWAS
### Title: Genomewide Association Study
### Aliases: cGWAS
### Keywords: GWAS

### ** Examples

## Not run: 
##D # generate random data
##D rand_data(500,5000)
##D 
##D 
##D ### GWAS without accounting for population structure
##D mod <- cGWAS(y,M)
##D 
##D ### GWAS - accounting for population structure
##D ## Estimate variance covariance matrix of y
##D 
##D G <- cgrm.A(M,lambda=0.01)
##D 
##D fit <- cGBLUP(y,G,verbose=FALSE)
##D 
##D ### construct V
##D V <- G*fit$var_a + diag(length(y))*fit$var_e
##D 
##D ### get the inverse square root of V
##D V2inv <- V %**% -0.5
##D 
##D ### run GWAS again
##D mod2 <- cGWAS(y,M,V=V2inv,verbose=TRUE)
## End(Not run)





