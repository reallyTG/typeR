library(yuima)


### Name: Diagnostic.Cogarch
### Title: Function for checking the statistical properties of the
###   COGARCH(p,q) model
### Aliases: Diagnostic.Cogarch

### ** Examples

## Not run: 
##D # Definition of the COGARCH(1,1) process driven by a Variance Gamma nois:
##D param.VG <- list(a1 = 0.038,  b1 =  0.053,
##D                   a0 = 0.04/0.053,lambda = 1, alpha = sqrt(2), beta = 0, mu = 0, 
##D                   x01 = 50.33)
##D 
##D cog.VG <- setCogarch(p = 1, q = 1, work = FALSE,
##D                       measure=list(df="rvgamma(z, lambda, alpha, beta, mu)"),
##D                       measure.type = "code", 
##D                       Cogarch.var = "y",
##D                       V.var = "v", Latent.var="x",
##D                       XinExpr=TRUE)
##D 
##D # Verify the stationarity and the positivity of th variance process
##D 
##D test <- Diagnostic.Cogarch(cog.VG,param=param.VG)
##D show(test)
##D 
##D # Simulate a sample path
##D 
##D set.seed(210)
##D 
##D Term=800
##D num=24000
##D 
##D samp.VG <- setSampling(Terminal=Term, n=num)
##D 
##D sim.VG <- simulate(cog.VG,
##D                     true.parameter=param.VG,
##D                     sampling=samp.VG,
##D                     method="euler")
##D plot(sim.VG)
##D 
##D # Estimate the model
##D 
##D res.VG <- gmm(sim.VG, start = param.VG, Est.Incr = "IncrPar")
##D 
##D summary(res.VG)
##D 
##D #  Check if the estimated COGARCH(1,1) has a positive and stationary variance
##D 
##D test1<-Diagnostic.Cogarch(res.VG)
##D show(test1)
##D 
##D # Simulate a COGARCH sample path using the estimated COGARCH(1,1) 
##D # and the recovered increments of underlying Variance Gamma Noise
##D 
##D esttraj<-simulate(res.VG)
##D plot(esttraj)
##D 
##D 
## End(Not run)  



