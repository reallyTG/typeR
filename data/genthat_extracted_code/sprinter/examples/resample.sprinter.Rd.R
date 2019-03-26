library(sprinter)


### Name: resample.sprinter
### Title: Wrapper for the function 'sprinter' in order to judge the
###   stability of the selected variables
### Aliases: resample.sprinter

### ** Examples

############
# Example for resampling and screening main effects by CoxBoost, 
# screening interactions by random forest and 
# building a final Cox proportional hazards model by CoxBoost:
# system.time with one core:
#   user  system elapsed 
# 399.78    2.40  403.02 
# For a faster run set repetitions down!
############

## Not run: 
##D # Create survival data with interactions:
##D data <- simul.int(518,n = 200, p = 500,
##D                    beta.int = 1.0,
##D                    beta.main = 0.9, 
##D                    censparam = 1/20, 
##D                    lambda = 1/20)[[1]]
##D set.seed(123)
##D 
##D resamcb <- resample.sprinter(  x=data[,1:500],  
##D                                time = data$obs.time,
##D                                status= data$obs.status,
##D                                fold = 10,
##D                                repetitions = 5, 
##D                                mandatory = c("ID1","ID2"),
##D                                n.inter.candidates = 1000, 
##D                                screen.main = fit.CoxBoost, 
##D                                fit.final = fit.CoxBoost,  
##D                                args.screen.main = list(stepno = 5),
##D                                parallel = F)
##D summary(resamcb)
##D summary(resamcb, optional = T)
## End(Not run)
# true coefficients:
# Clin.cov1   Clin.cov2   ID5:ID6   ID7:ID8
# 0.9         -0.9        1         -1


## Example for resampling and screening main effects by CoxBoost, 
## screening interactions by random forest and 
## building a final Cox proportional hazards model by CoxBoost:
##
##system.time with one core:
##   user  system elapsed 
##  479.55    2.39  482.40  
## For a faster run set repetitions down!

## Not run: 
##D # Create survival data with interactions:
##D data <- simul.int(518,n = 200, p = 500,
##D                    beta.int = 1.0,
##D                    beta.main = 0.9, 
##D                    censparam = 1/20, 
##D                    lambda = 1/20)[[1]]
##D 
##D resamunicox <- resample.sprinter(  x=data[,1:500],  
##D                                time = data$obs.time,
##D                                status= data$obs.status,
##D                                fold = 10,
##D                                repetitions = 10, 
##D                                mandatory = c("ID1","ID2"),
##D                                n.inter.candidates = 1000, 
##D                                screen.main = fit.uniCox, 
##D                                fit.final = fit.uniCox,  
##D                                parallel = FALSE)
##D                                
##D                                
##D summary(resamunicox)
##D summary(resamunicox, optional = TRUE)
##D 
## End(Not run)



