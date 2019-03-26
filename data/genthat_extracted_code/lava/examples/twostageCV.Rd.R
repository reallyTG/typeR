library(lava)


### Name: twostageCV
### Title: Cross-validated two-stage estimator
### Aliases: twostageCV

### ** Examples

## No test: 
 ## Reduce Ex.Timings
m1 <- lvm( x1+x2+x3 ~ u1, latent= ~u1)
m2 <- lvm( y ~ 1 )
m <- functional(merge(m1,m2), y ~ u, f=function(x) sin(x)+x)
distribution(m, ~u1) <- uniform.lvm(-6,6)
d <- sim(m,n=500,seed=1)
nonlinear(m2) <- y~u1
val <- twostageCV(m1, m2, data=d, std.err=FALSE, df=2:6, nmix=1:2,
                  nfolds=2, mc.cores=1)
val
## End(No test)



