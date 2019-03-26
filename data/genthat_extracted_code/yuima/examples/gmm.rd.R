library(yuima)


### Name: gmm
### Title: Method of Moments for COGARCH(P,Q).
### Aliases: gmm gmm.COGARCH 'Method of Moment COGARCH'
### Keywords: Method of Moments Estimation COGARCH

### ** Examples

## Not run: 
##D # Example COGARCH(1,1): the parameters are the same used in Haugh et al. 2005. In this case
##D # we assume the underlying noise is a symmetric variance gamma.
##D # As first step we define the COGARCH(1,1) in yuima:
##D 
##D mod1 <- setCogarch(p = 1, q = 1, work = FALSE,
##D                    measure=list(df="rbgamma(z,1,sqrt(2),1,sqrt(2))"),
##D                     measure.type = "code", Cogarch.var = "y",
##D                     V.var = "v", Latent.var="x",XinExpr=TRUE)
##D 
##D param <- list(a1 = 0.038,  b1 =  0.053,
##D               a0 = 0.04/0.053, x01 = 20)
##D 
##D # We generate a trajectory
##D samp <- setSampling(Terminal=10000, n=100000)
##D set.seed(210)
##D sim1 <- simulate(mod1, sampling = samp, true.parameter = param)
##D 
##D # We estimate the model
##D 
##D res1 <- gmm(yuima = sim1, start = param)
##D 
##D summary(res1)
##D 
## End(Not run)



