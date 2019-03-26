library(SightabilityModel)


### Name: Sight.Est
### Title: Sightability Model Estimator
### Aliases: Sight.Est
### Keywords: survey models

### ** Examples

# Load data frames
  data(obs.m) # observational survey data frame
  data(exp.m) # experimental survey data frame
  data(sampinfo.m) # information on sampling rates (contained in a data frame)
 
# Estimate population size in 2007 only
  sampinfo <- sampinfo.m[sampinfo.m$year == 2007,]
  Sight.Est(observed ~ voc, odat = obs.m[obs.m$year == 2007,],
    sdat = exp.m, sampinfo, method = "Wong", 
    logCI = TRUE, alpha = 0.05, Vm.boot = FALSE) 


# BELOW CODE IS SOMEWHAT TIME INTENSIVE (fits models using 2 variance estimators to 3 years of data)
# Estimate population size for 2004-2007
# Compare Wong's and Steinhorst and Samuel variance estimators
  tau.Wong <- tau.SS <- matrix(NA,4,3)
  count <- 1
  for(i in 2004:2007){
    sampinfo <- sampinfo.m[sampinfo.m$year == i,]

# Wong's variance estimator 
    temp <- Sight.Est(observed ~ voc, odat = obs.m[obs.m$year == i,],
       sdat = exp.m, sampinfo, method = "Wong", 
       logCI = TRUE, alpha = 0.05, Vm.boot = FALSE) 
    tau.Wong[count, ] <- unlist(summary(temp)) 
 
# Steinhorst and Samuel (with Samuel et al. 1992 modification) 
    temp <- Sight.Est(observed ~ voc, odat = obs.m[obs.m$year == i,],  
       sdat = exp.m, sampinfo, method = "SS")
    tau.SS[count, ] <- unlist(summary(temp)) 
    count<-count+1
  }  
  rownames(tau.Wong) <- rownames(tau.SS) <- 2004:2007
  colnames(tau.Wong) <- colnames(tau.SS) <- c("tau.hat","LCL","UCL")
  (tau.Wong <- apply(tau.Wong, 1:2, 
      FUN=function(x){as.numeric(gsub(",", "", x, fixed = TRUE))}))
  (tau.SS <-   (tau.Wong <- apply(tau.Wong, 1:2, 
     FUN = function(x){as.numeric(gsub(",", "", x, fixed = TRUE))})))

## Not run: 
##D   require(gplots)
##D   par(mfrow = c(1,1))
##D     plotCI(2004:2007-.1, tau.Wong[,1], ui = tau.Wong[,3], 
##D         li = tau.Wong[,2], type = "l", xlab = "", 
##D         ylab = "Population estimate", xaxt = "n",
##D         xlim=c(2003.8, 2007.2))
##D     plotCI(2004:2007+.1, tau.SS[,1], ui = tau.SS[,3], li = tau.SS[,2], 
##D          type = "b", lty = 2, add = TRUE)
##D     axis(side = 1, at = 2004:2007, labels = 2004:2007)  
##D   
## End(Not run)



