library(pifpaf)


### Name: risk.ratio.confidence
### Title: Confidence intervals for the Risk Ratio Integral
### Aliases: risk.ratio.confidence
### Keywords: internal

### ** Examples

## Not run: 
##D #Example 1: Exponential Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X        <- data.frame(rnorm(100))
##D thetahat <- 0.1
##D thetavar <- 0.2
##D rr       <- function(X, theta){exp(theta*X)}
##D risk.ratio.confidence(X, thetahat, rr, thetavar)
##D 
##D #We can force RR'.s CI to be >= 1.
##D #This should be done with extra methodological (philosophical) care as 
##D #RR>= 1 should only be assumed with absolute mathematical certainty
##D risk.ratio.confidence(X, thetahat, rr, thetavar, force.min = TRUE)
##D 
##D 
##D #Example 2: Multivariate Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X1        <- rnorm(1000)
##D X2        <- runif(1000)
##D X         <- data.frame(cbind(X1,X2))
##D thetahat  <- c(0.02, 0.01)
##D thetavar  <- matrix(c(0.1, 0, 0, 0.4), byrow = TRUE, nrow = 2)
##D rr        <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
##D risk.ratio.confidence(X, thetahat, rr, thetavar) 
##D 
##D #Example 3: Categorical Relative Risk & Exposure
##D #--------------------------------------------
##D set.seed(18427)
##D X        <- as.data.frame(sample(c("Normal","Overweight","Obese"), 100, 
##D                    replace = TRUE, prob = c(0.4, 0.1, 0.5)))
##D thetahat <- c(1, 1.2, 1.5)
##D thetavar  <- diag(c(0.1, 0.2, 0.4))
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
##D risk.ratio.confidence(data.frame(X), thetahat, rr, thetavar)
##D 
##D #Example 4: Categorical Relative Risk & continuous exposure
##D #----------------------------------------------------------
##D set.seed(18427)
##D BMI      <- data.frame(rlnorm(100, 3.1, sdlog = 0.1))
##D thetahat <- c(Malnourished = 2.2, Normal = 1, Overweight = 1.8, Obese = 2.5)
##D thetavar <- diag(c(0.5, 0.1, 0.1, 0.2))
##D rr       <- function(X, theta){
##D      
##D      #Create return vector with default risk of 1
##D      r_risk <- rep(1, length(X))
##D    
##D      #Assign categorical relative risk
##D      r_risk[which(X < 20)]                             <- theta[1] #Malnourished
##D      r_risk[intersect(which(X >= 20), which(X < 25))]  <- theta[2] #Normal
##D      r_risk[intersect(which(X >= 25), which(X < 30))]  <- theta[3] #Overweight
##D      r_risk[which(X >= 30)]                            <- theta[4] #Obese
##D    
##D    return(r_risk)
##D }
##D 
##D risk.ratio.confidence(BMI, thetahat, rr, thetavar)
##D 
##D #Example 5: Bivariate exposure and rr ("classical rr")
##D #------------------------------------------------------------------
##D set.seed(18427)
##D X        <- sample(c("Exposed","Unexposed"), 1000, replace = TRUE, prob = c(0.1, 0.9))
##D thetahat <- c("Exposed" = 2.5, "Unexposed" = 1.2)  
##D thetavar <- matrix(c(0.1, 0.2, 0.2, 0.4), ncol = 2)
##D rr <- function(X, theta){
##D    
##D    #Create relative risk function
##D    r_risk <- rep(1, length(X))
##D    
##D    #Assign values of relative risk
##D    r_risk[which(X == "Unexposed")] <- theta["Unexposed"]
##D    r_risk[which(X == "Exposed")]   <- theta["Exposed"]
##D    
##D    return(r_risk)
##D }    
##D 
##D risk.ratio.confidence(data.frame(X), thetahat, rr, thetavar)
## End(Not run)



