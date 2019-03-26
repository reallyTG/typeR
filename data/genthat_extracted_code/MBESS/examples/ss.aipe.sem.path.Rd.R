library(MBESS)


### Name: ss.aipe.sem.path
### Title: Sample size planning for SEM targeted effects
### Aliases: ss.aipe.sem.path
### Keywords: design multivariate

### ** Examples

## Not run: 
##D # Suppose the model of interest is Model 2 in the simulation study 
##D # in Lai and Kelley (2010), and the goal is to obtain a 95% confidence 
##D # interval for 'beta21' no wider than 0.3. The necessary sample size 
##D # can be calculated as follows.
##D 
##D library(sem)
##D 
##D # specify a model object in the RAM notation
##D model.2<-specifyModel()
##D xi1 -> y1, lambda1, 1
##D xi1 -> y2, NA, 1
##D xi1 -> y3, lambda2, 1
##D xi1 -> y4, lambda3, 0.3
##D eta1 -> y4, lambda4, 1
##D eta1 -> y5, NA, 1
##D eta1 -> y6, lambda5, 1
##D eta1 -> y7, lambda6, 0.3
##D eta2 -> y6, lambda7, 0.3
##D eta2 -> y7, lambda8, 1
##D eta2 -> y8, NA, 1
##D eta2 -> y9, lambda9, 1
##D xi1 -> eta1, gamma11, 0.6
##D eta1 -> eta2, beta21, 0.6 
##D xi1 <-> xi1, phi11, 0.49
##D eta1 <-> eta1, psi11, 0.3136
##D eta2 <-> eta2, psi22, 0.3136
##D y1 <-> y1, delta1, 0.51
##D y2 <-> y2, delta2, 0.51
##D y3 <-> y3, delta3, 0.51
##D y4 <-> y4, delta4, 0.2895
##D y5 <-> y5, delta5, 0.51
##D y6 <-> y6, delta6, 0.2895
##D y7 <-> y7, delta7, 0.2895
##D y8 <-> y8, delta8, 0.51
##D y9 <-> y9, delta9, 0.51
##D 
##D 
##D # to inspect the specified model
##D model.2
##D 
##D # one way to specify the population covariance matrix is to first 
##D # specify path coefficients and then calcualte the model-implied 
##D # covariance matrix
##D theta <- c(1, 1, 0.3, 1,1, 0.3, 0.3, 1, 1, 0.6, 0.6,
##D 0.49, 0.3136, 0.3136, 0.51, 0.51, 0.51, 0.2895, 0.51, 0.2895, 0.2895, 0.51, 0.51)
##D 
##D names(theta) <- c("lambda1","lambda2","lambda3",
##D "lambda4","lambda5","lambda6","lambda7","lambda8","lambda9",
##D "gamma11", "beta21",
##D "phi11", "psi11", "psi22", 
##D "delta1","delta2","delta3","delta4","delta5","delta6","delta7",
##D "delta8","delta9")
##D 
##D res<-theta.2.Sigma.theta(model=model.2, theta=theta, 
##D latent.vars=c("xi1", "eta1","eta2"))
##D 
##D Sigma.theta <- res$Sigma.theta
##D # thus 'Sigma.theta' is the input covariance matrix for sample size 
##D # planning procedure.
##D 
##D # the necessary sample size can be calculated as follows.
##D # ss.aipe.sem.path(model=model.2, Sigma=Sigma.theta, 
##D # desired.width=0.3, which.path="beta21")
## End(Not run)



