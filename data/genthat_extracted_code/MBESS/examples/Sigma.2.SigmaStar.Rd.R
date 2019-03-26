library(MBESS)


### Name: Sigma.2.SigmaStar
### Title: Construct a covariance matrix with specified error of
###   approximation
### Aliases: Sigma.2.SigmaStar
### Keywords: multivariate

### ** Examples

## Not run: 
##D library(sem)
##D 
##D ###############
##D ## EXAMPLE 1; a CFA model with three latent variables and nine indicators.
##D ###############
##D 
##D # To specify the model
##D model.cfa<-specify.model()
##D xi1 -> x1, lambda1, 0.6
##D xi1 -> x2, lambda2, 0.7
##D xi1 -> x3, lambda3, 0.8
##D xi2 -> x4, lambda4, 0.65
##D xi2 -> x5, lambda5, 0.75
##D xi2 -> x6, lambda6, 0.85
##D xi3 -> x7, lambda7, 0.5
##D xi3 -> x8, lambda8, 0.7
##D xi3 -> x9, lambda9, 0.9
##D xi1 <-> xi1, NA, 1
##D xi2 <-> xi2, NA, 1
##D xi3 <-> xi3, NA, 1
##D xi1 <-> xi2, phi21, 0.5
##D xi1 <-> xi3, phi31, 0.4
##D xi2 <-> xi3, phi32, 0.6
##D x1 <-> x1, delta11, 0.36
##D x2 <-> x2, delta22, 0.5
##D x3 <-> x3, delta33, 0.9
##D x4 <-> x4, delta44, 0.4
##D x5 <-> x5, delta55, 0.5
##D x6 <-> x6, delta66, 0.6
##D x7 <-> x7, delta77, 0.6
##D x8 <-> x8, delta88, 0.7
##D x9 <-> x9, delta99, 0.7
##D 
##D 
##D # To specify model parameters
##D theta <- c(0.6, 0.7, 0.8,
##D 0.65, 0.75, 0.85,
##D 0.5, 0.7, 0.9,
##D 0.5, 0.4, 0.6,
##D 0.8, 0.6, 0.5,
##D 0.6, 0.5, 0.4,
##D 0.7, 0.7, 0.6)
##D 
##D names(theta) <- c("lambda1", "lambda2", "lambda3", 
##D "lambda4","lambda5", "lambda6", 
##D "lambda7", "lambda8","lambda9",
##D "phi21", "phi31", "phi32", 
##D "delta11", "delta22","delta33",
##D "delta44", "delta55","delta66",
##D "delta77", "delta88","delta99")
##D 
##D res.matrix <- Sigma.2.SigmaStar(model=model.cfa, model.par=theta, 
##D latent.var=c("xi1", "xi2", "xi3"), discrep=0.06)
##D 
##D # res.matrix
##D 
##D # To verify the returned covariance matrix; the model chi-square
##D # should be equal to (N-1) times the specified discrepancy value.
##D # Also the "point estimates" of model parameters should be 
##D # equal to the specified model parameters
##D 
##D # res.sem<-sem(model.cfa, res.matrix$Sigma.star, 1001)
##D # summary(res.sem)
##D 
##D # To construct a covariance matrix so that the model has
##D # a desired population RMSEA value, one can transform the RMSEA
##D # value to the discrepancy value
##D 
##D res.matrix <- Sigma.2.SigmaStar(model=model.cfa, model.par=theta, 
##D latent.var=c("xi1", "xi2", "xi3"), discrep=0.075*0.075*24)
##D 
##D # To verify the population RMSEA value
##D # res.sem<-sem(model.cfa, res.matrix$Sigma.star, 1000000)
##D # summary(res.sem)
##D 
##D ###############
##D ## EXAMPLE 2; an SEM model with five latent variables
##D ###############
##D 
##D model.5f <- specify.model()
##D eta1 -> y4, NA, 1
##D eta1 -> y5, lambda5, NA
##D eta2 -> y1, NA, 1
##D eta2 -> y2, lambda2, NA 
##D eta2 -> y3, lambda3, NA
##D xi1 -> x1, NA, 1
##D xi1 -> x2, lambda6, NA 
##D xi1 -> x3, lambda7, NA
##D xi2 -> x4, NA, 1
##D xi2 -> x5, lambda8, NA 
##D xi3 -> x6, NA, 1
##D xi3 -> x7, lambda9, NA 
##D xi3 -> x8, lambda10, NA
##D xi1 -> eta1, gamma11, NA
##D xi2 -> eta1, gamma12, NA
##D xi3 -> eta1, gamma13, NA
##D xi3 -> eta2, gamma23, NA
##D eta1 -> eta2, beta21, NA
##D xi1 <-> xi2, phi21, NA
##D xi1 <-> xi3, phi31, NA
##D xi3 <-> xi2, phi32, NA
##D xi1 <-> xi1, phi11, NA
##D xi2 <-> xi2, phi22, NA
##D xi3 <-> xi3, phi33, NA
##D eta1 <-> eta1, psi11, NA
##D eta2 <-> eta2, psi22, NA
##D y1 <-> y1, eplison11, NA
##D y2 <-> y2, eplison22, NA
##D y3 <-> y3, eplison33, NA
##D y4 <-> y4, eplison44, NA
##D y5 <-> y5, eplison55, NA
##D x1 <-> x1, delta11, NA
##D x2 <-> x2, delta22, NA
##D x3 <-> x3, delta33, NA
##D x4 <-> x4, delta44, NA
##D x5 <-> x5, delta55, NA
##D x6 <-> x6, delta66, NA
##D x7 <-> x7, delta77, NA
##D x8 <-> x8, delta88, NA
##D 
##D 
##D theta <- c(0.84, 0.8, 0.9, 
##D 1.26, 0.75, 1.43, 1.58, 0.83, 
##D 0.4, 0.98, 0.52, 0.6,0.47, 
##D 0.12, 0.14, 0.07,
##D 0.44, 0.22, 0.25, 
##D 0.3, 0.47, 
##D 0.37, 0.5, 0.4, 0.4, 0.58, 
##D 0.56,0.3, 0.6, 0.77, 0.54, 0.75, 0.37, 0.6)
##D 
##D names(theta) <- c(
##D "lambda5","lambda2","lambda3",
##D "lambda6","lambda7","lambda8","lambda9","lambda10" , 
##D "gamma11",  "gamma12","gamma13" ,  "gamma23" ,  "beta21",
##D "phi21","phi31", "phi32", 
##D "phi11","phi22",  "phi33",     
##D "psi11" ,    "psi22"   ,  
##D "eplison11","eplison22" ,"eplison33", "eplison44" ,"eplison55", 
##D   "delta11"  , "delta22" ,  "delta33" ,  "delta44" ,  "delta55" ,  "delta66",  
##D "delta77" , "delta88")
##D 
##D # To construct a covariance matrix so that the model has 
##D # a population RMSEA of 0.08
##D 
##D res.matrix <- Sigma.2.SigmaStar(model=model.5f, model.par=theta, 
##D latent.var=c("xi1", "xi2", "xi3", "eta1","eta2"), discrep=0.08*0.08*57)
##D 
##D # To verify
##D # res.sem<- sem(model.5f, res.matrix$Sigma.star, 1000000)
##D # summary(res.sem)
## End(Not run)



