library(spaMM)


### Name: pedigree
### Title: Fit mixed-effects models incorporating pedigrees
### Aliases: pedigree

### ** Examples

## Not run: 
##D if(requireNamespace("pedigreemm", quietly=TRUE)) {
##D ## derived from help("pedigreemm")
##D   p1 <- new("pedigree",
##D            sire = as.integer(c(NA,NA,1, 1,4,5)),
##D            dam  = as.integer(c(NA,NA,2,NA,3,2)),
##D            label = as.character(1:6))
##D   A <- pedigreemm::getA(p1) ## relationship matrix
##D   ## data simulation
##D   cholA <- chol(A)  
##D   varU <- 0.4; varE <- 0.6; rep <- 20
##D   n <- rep*6
##D   set.seed(108)
##D   bStar <- rnorm(6, sd=sqrt(varU))
##D   b <- crossprod(as.matrix(cholA),bStar)
##D   ID <- rep(1:6, each=rep)
##D   e0 <- rnorm(n, sd=sqrt(varE))
##D   y <- b[ID]+e0
##D   obs <- data.frame(y=y,IDgen=ID,IDenv=ID) ## two copies of ID for readability of GLMM results
##D   ## fits
##D   fitme(y ~ 1+ corrMatrix(1|IDgen) , corrMatrix=A,data=obs,method="REML")
##D   obs$y01 <- ifelse(y<1.3,0,1)
##D   fitme(y01 ~ 1+ corrMatrix(1|IDgen)+(1|IDenv), corrMatrix=A,data=obs, 
##D         family=binomial(), method="REML")
##D   prec_mat <- solve(A)
##D   colnames(prec_mat) <- rownames(prec_mat) <- rownames(A) # important
##D   fitme(y01 ~ 1+ corrMatrix(1|IDgen)+(1|IDenv) , covStruct=list(precision=prec_mat),
##D         data=obs, family=binomial(), method="REML")
##D }
## End(Not run)



