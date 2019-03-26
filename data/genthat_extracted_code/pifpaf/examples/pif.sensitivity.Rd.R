library(pifpaf)


### Name: pif.sensitivity
### Title: Potential Impact Fraction Sensitivity Analysis plot
### Aliases: pif.sensitivity

### ** Examples

## Not run: 
##D #Example 1
##D #------------------------------------------------------------------
##D set.seed(3284)
##D X  <- data.frame(Exposure = rnorm(250,3)) #Sample
##D rr <- function(X,theta){exp(X*theta)}     #Relative risk
##D theta <- 0.1                              #Estimate of theta
##D 
##D pif.sensitivity(X, thetahat = theta, rr = rr)
##D 
##D 
##D #Save file
##D #require(ggplot2)
##D #ggsave("My Potential Impact Fraction Sensitivity Analysis.pdf")
##D 
##D #Example 2
##D #--------------------------------------------------------------
##D set.seed(3284)
##D X     <- data.frame(Exposure = rbeta(1000, 1, 0.2))
##D theta <- c(0.12, 1)
##D rr    <- function(X, theta){X*theta[1] + theta[2]}
##D cft   <- function(X){X/2}
##D 
##D 
##D #Using empirical method
##D pif.sensitivity(X, thetahat = theta, rr = rr, cft = cft,
##D                 mremove = 100, nsim = 50, 
##D                 title = "My Sensitivity Analysis for example 1")
##D                 
##D #Same example with kernel
##D pif.sensitivity(X, theta, rr = rr, cft = cft,
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
##D    r_risk <- rep(1, length(X))
##D    
##D    #Assign categorical relative risk
##D    r_risk[which(X == "Normal")]      <- thetahat[1]
##D    r_risk[which(X == "Overweight")]  <- thetahat[2]
##D    r_risk[which(X == "Obese")]       <- thetahat[3]
##D    
##D    return(r_risk)
##D }
##D 
##D 
##D #Counterfactual of halving the percent of obesity and overweight cases
##D #to normality
##D cft <- function(X){
##D 
##D    #Find the overweight and obese individuals
##D    which_obese <- which(X == "Obese")
##D    which_over  <- which(X == "Overweight")
##D    
##D    #Reduce per.over % of overweight and per.obese % of obese
##D    X[sample(which_obese, floor(length(which_obese)*0.5)),1] <- "Normal"
##D    X[sample(which_over,  floor(length(which_over)*0.5)),1]  <- "Normal"
##D    
##D    return(X)
##D }
##D 
##D 
##D pifplot <- pif.sensitivity(X, thetahat = thetahat, rr = rr, cft = cft, 
##D                            title = "Sensitivity analysis of PIF for excess-weight",
##D                            colors = rainbow(4), 
##D                            legendtitle = "Values", 
##D                            check_exposure = FALSE, check_rr = FALSE)              
##D pifplot              
##D 
##D #You can edit pifplot as it is a ggplot object
##D #require(ggplot2)
##D #pifplot + theme_classic()
## End(Not run)




