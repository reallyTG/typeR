library(lmomco)


### Name: Lcomoment.correlation
### Title: L-correlation Matrix (L-correlation through Sample L-comoments)
### Aliases: Lcomoment.correlation
### Keywords: multivariate L-comoment

### ** Examples

D   <- data.frame(X1=rnorm(30), X2=rnorm(30), X3=rnorm(30))
L2  <- Lcomoment.matrix(D,k=2)
RHO <- Lcomoment.correlation(L2)
## Not run: 
##D "SerfXiao.eq17" <-
##D  function(n=25, A=10, B=2, k=4,
##D           method=c("pearson","lcorr"), wrt=c("12", "21")) {
##D    method <- match.arg(method); wrt <- match.arg(wrt)
##D    # X1 is a linear regression on X2
##D    X2 <- rnorm(n); X1 <- A + B*X2 + rnorm(n)
##D    r12p <- cor(X1,X2) # Pearson's product moment correlation
##D    XX <- data.frame(X1=X1, X2=X2) # for the L-comoments
##D    T2 <- Lcomoment.correlation(Lcomoment.matrix(XX, k=2))$matrix
##D    LAMk <- Lcomoment.matrix(XX, k=k)$matrix # L-comoments of order k
##D    if(wrt == "12") { # is X2 the sorted variable?
##D       lmr <- lmoms(X1, nmom=k); Lamk <- LAMk[1,2]; Lcor <- T2[1,2]
##D    } else {          # no X1 is the sorted variable (21)
##D       lmr <- lmoms(X2, nmom=k); Lamk <- LAMk[2,1]; Lcor <- T2[2,1]
##D    }
##D    # Serfling and Xiao (2007, eq. 17) state that
##D    # L-comoment_k[12] = corr.coeff * Lmoment_k[1] or
##D    # L-comoment_k[21] = corr.coeff * Lmoment_k[2]
##D    # And with the X1, X2 setup above, Pearson corr. == L-corr.
##D    # There will be some numerical differences for any given sample.
##D    ifelse(method == "pearson",
##D              return(lmr$lambdas[k]*r12p - Lamk),
##D              return(lmr$lambdas[k]*Lcor - Lamk))
##D    # If the above returns a expected value near zero then, their eq.
##D    # is numerically shown to be correct and the estimators are unbiased.
##D }
##D 
##D # The means should be near zero.
##D nrep <- 2000; seed <- rnorm(1); set.seed(seed)
##D mean(replicate(n=nrep, SerfXiao.eq17(method="pearson", k=4)))
##D set.seed(seed)
##D mean(replicate(n=nrep, SerfXiao.eq17(method="lcorr", k=4)))
##D # The variances should nearly be equal.
##D seed <- rnorm(1); set.seed(seed)
##D var(replicate(n=nrep, SerfXiao.eq17(method="pearson", k=6)))
##D set.seed(seed)
##D var(replicate(n=nrep, SerfXiao.eq17(method="lcorr", k=6)))
## End(Not run)



