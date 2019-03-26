library(AICcmodavg)


### Name: modavgCustom
### Title: Compute Model-averaged Parameter Estimate (Multimodel Inference)
###   from User-supplied Input
### Aliases: modavgCustom print.modavgCustom
### Keywords: models

### ** Examples

## Not run: 
##D ##model averaging parameter estimate (natural average)
##D ##vector with model LL's
##D LL <- c(-38.8876, -35.1783, -64.8970)
##D 
##D ##vector with number of parameters
##D Ks <- c(7, 9, 4)
##D 
##D ##create a vector of names to trace back models in set
##D Modnames <- c("Cm1", "Cm2", "Cm3")
##D 
##D ##vector of beta estimates for a parameter of interest
##D model.ests <- c(0.0478, 0.0480, 0.0478)
##D 
##D ##vector of SE's of beta estimates for a parameter of interest
##D model.se.ests <- c(0.0028, 0.0028, 0.0034)
##D 
##D ##compute model-averaged estimate and unconditional SE based on AICc
##D modavgCustom(logL = LL, K = Ks, modnames = Modnames, 
##D              estimate = model.ests, se = model.se.ests, nobs = 121)
##D ##compute model-averaged estimate and unconditional SE based on BIC
##D modavgCustom(logL = LL, K = Ks, modnames = Modnames, 
##D              estimate = model.ests, se = model.se.ests, nobs = 121,
##D              useBIC = TRUE)
##D 
##D 
##D ##model-averaging with shrinkage based on AICc
##D ##set up candidate models
##D data(min.trap)
##D Cand.mod <- list( )
##D ##global model          
##D Cand.mod[[1]] <- glm(Num_anura ~ Type + log.Perimeter,
##D                      family = poisson, offset = log(Effort),
##D                      data = min.trap) 
##D Cand.mod[[2]] <- glm(Num_anura ~ Type + Num_ranatra, family = poisson,
##D                      offset = log(Effort), data = min.trap) 
##D Cand.mod[[3]] <- glm(Num_anura ~ log.Perimeter + Num_ranatra,
##D                      family = poisson, offset = log(Effort), data = min.trap)
##D Model.names <- c("Type + log.Perimeter", "Type + Num_ranatra",
##D                  "log.Perimeter + Num_ranatra")
##D ##model-averaged estimate with shrinkage (glm model type is already supported)
##D modavgShrink(cand.set = Cand.mod, modnames = Model.names,
##D              parm = "log.Perimeter")
##D 
##D ##equivalent manual version of model-averaging with shrinkage
##D ##this is especially useful when model classes are not supported
##D ##extract vector of LL
##D LLs <- sapply(Cand.mod, FUN = function(i) logLik(i)[1])
##D ##extract vector of K
##D Ks <- sapply(Cand.mod, FUN = function(i) attr(logLik(i), "df"))
##D ##extract betas
##D betas <- sapply(Cand.mod, FUN = function(i) coef(i)["log.Perimeter"])
##D ##second model does not include log.Perimeter
##D betas[2] <- 0
##D ##extract SE's
##D ses <- sapply(Cand.mod, FUN = function(i) sqrt(diag(vcov(i))["log.Perimeter"]))
##D ses[2] <- 0
##D ##model-averaging with shrinkage based on AICc
##D modavgCustom(logL = LLs, K = Ks, modnames = Model.names,
##D              nobs = nrow(min.trap), estimate = betas, se = ses)
##D ##model-averaging with shrinkage based on BIC
##D modavgCustom(logL = LLs, K = Ks, modnames = Model.names,
##D              nobs = nrow(min.trap), estimate = betas, se = ses,
##D              useBIC = TRUE)
## End(Not run)



