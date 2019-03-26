library(pifpaf)


### Name: paf.sensitivity
### Title: Population Attributable Fraction Sensitivity Analysis Plot
### Aliases: paf.sensitivity

### ** Examples

## Not run: 
##D #Example 1
##D #------------------------------------------------------------------
##D set.seed(3284)
##D X  <- data.frame(rnorm(250,3))            #Sample
##D rr <- function(X,theta){exp(X*theta)}     #Relative risk
##D theta <- 0.1                              #Estimate of theta
##D paf.sensitivity(X, thetahat = theta, rr = rr)
##D 
##D 
##D #Save file
##D #require(ggplot2)
##D #ggsave("My Population Attributable Fraction Sensitivity Analysis.pdf")
##D 
##D #Example 2
##D #--------------------------------------------------------------
##D set.seed(3284)
##D X     <- data.frame(rbeta(1000, 1, 0.2))
##D theta <- c(0.12, 1)
##D rr    <- function(X, theta){X*theta[1] + theta[2]}
##D 
##D 
##D #Using empirical method
##D paf.sensitivity(X, thetahat = theta, rr = rr, 
##D                 mremove = 100, nsim = 50, 
##D                 title = "My Sensitivity Analysis for example 1")
##D                 
##D #Same example with kernel
##D paf.sensitivity(X, theta, rr = rr, 
##D                  mremove = 100, nsim = 50, method = "kernel", 
##D                  title = "Sensitivity Analysis for example 1 using kernel")
##D                  
##D 
##D #Example 3: Plot counterfactual with categorical risks
##D #------------------------------------------------------------------
##D set.seed(18427)
##D X        <- data.frame(Exposure = 
##D                sample(c("Normal","Overweight","Obese"), 1000, 
##D                       replace = TRUE, prob = c(0.4, 0.1, 0.5)))
##D thetahat <- c(1, 1.7, 2)
##D 
##D #Categorical relative risk function
##D rr <- function(X, theta){
##D 
##D    #Create return vector with default risk of 1
##D    r_risk <- rep(1, nrow(X))
##D    
##D    #Assign categorical relative risk
##D    r_risk[which(X[,"Exposure"] == "Normal")]      <- thetahat[1]
##D    r_risk[which(X[,"Exposure"] == "Overweight")]  <- thetahat[2]
##D    r_risk[which(X[,"Exposure"] == "Obese")]       <- thetahat[3]
##D    
##D    return(r_risk)
##D }
##D 
##D 
##D pafplot <- paf.sensitivity(X, thetahat = thetahat, rr = rr, 
##D                            title = "Sensitivity analysis of PAF for excess-weight",
##D                            colors = rainbow(4), 
##D                            legendtitle = "Values", 
##D                            check_exposure = FALSE, check_rr = FALSE)              
##D pafplot              
##D 
##D #You can edit pafplot as it is a ggplot object
##D #require(ggplot2)
##D #pafplot + theme_classic()
## End(Not run)




