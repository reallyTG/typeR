library(pifpaf)


### Name: paf.confidence
### Title: Confidence Intervals for the Population Attributable Fraction
### Aliases: paf.confidence

### ** Examples


#Example 1: Exponential Relative Risk
#--------------------------------------------
set.seed(18427)
X        <- data.frame(Exposure = rnorm(100,3,1))
thetahat <- 0.32
thetavar <- 0.02
rr       <- function(X, theta){exp(theta*X)}

#Using bootstrap method
paf.confidence(X, thetahat, rr, thetavar)

## Not run: 
##D #Same example with loglinear method
##D paf.confidence(X, thetahat, rr, thetavar, confidence_method = "loglinear")
##D 
##D #Same example with linear method (usually the widest and least precise)
##D paf.confidence(X, thetahat, rr, thetavar, confidence_method = "linear")
##D 
##D #Same example with inverse method 
##D paf.confidence(X, thetahat, rr, thetavar, confidence_method = "inverse")
##D 
##D #Same example with one2one method 
##D #assume 99% ci of theta is [0.27, 0.35]
##D paf.confidence(X, thetahat, rr, thetalow = 0.27, thetaup = 0.35, 
##D confidence_method = "one2one", confidence_theta = 99)
##D 
##D #Example 2: Linear Relative Risk with weighted sample
##D #--------------------------------------------
##D set.seed(18427)
##D X                   <- data.frame(Exposure = rbeta(100,3,1))
##D weights             <- runif(100)
##D normalized_weights  <- weights/sum(weights)
##D thetahat            <- 0.17
##D thetavar            <- 0.01
##D rr                  <- function(X, theta){theta*X^2 + 1}
##D paf.confidence(X, thetahat, rr, thetavar, weights = normalized_weights)
##D 
##D #Change the confidence level and paf method
##D paf.confidence(X, thetahat, rr,  thetavar, weights = normalized_weights, 
##D      method = "kernel", confidence = 90)
##D 
##D 
##D #Example 3: Multivariate Linear Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X1       <- rnorm(100,4,1)
##D X2       <- rnorm(100,2,0.4)
##D thetahat <- c(0.12, 0.03)
##D thetavar <- diag(c(0.01, 0.02))
##D 
##D #But the approximate method crashes due to operator
##D Xmean <- data.frame(Exposure = mean(X1), 
##D                     Covariate = mean(X2))
##D Xvar  <- var(cbind(X1, X2))
##D 
##D #When creating relative risks avoid using the $ operator
##D #as it doesn't work under approximate method of PAF
##D rr_not    <- function(X, theta){
##D                exp(theta[1]*X$Exposure + theta[2]*X$Covariate)
##D              }
##D rr_better <- function(X, theta){
##D                exp(theta[1]*X[,"Exposure"] + theta[2]*X[,"Covariate"])
##D              }
##D              
##D paf.confidence(Xmean, thetahat, rr_better, thetavar,
##D                method = "approximate", Xvar = Xvar)
## End(Not run)
## Not run: 
##D #Warning: $ operator in rr definitions don't work in approximate
##D paf.confidence(Xmean, thetahat, rr_not, thetavar,
##D                method = "approximate", Xvar = Xvar)
## End(Not run)

## Not run: 
##D #Example 4: Categorical Relative Risk & Exposure
##D #--------------------------------------------
##D set.seed(18427)
##D mysample  <- sample(c("Normal","Overweight","Obese"), 100, 
##D                    replace = TRUE, prob = c(0.4, 0.1, 0.5))
##D X        <- data.frame(Exposure = mysample)
##D 
##D thetahat <- c(1, 1.2, 1.5)
##D thetavar <- diag(c(0.1, 0.2, 0.3))
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
##D paf.confidence(X, thetahat, rr, thetavar, check_rr = FALSE)
##D 
##D 
##D #Example 5: Continuous Exposure and Categorical Relative Risk
##D #------------------------------------------------------------------
##D set.seed(18427)
##D 
##D #Assume we have BMI from a sample
##D BMI          <- data.frame(Exposure = rlnorm(100, 3.1, sdlog = 0.1))
##D 
##D #Theoretical minimum risk exposure is at 20kg/m^2 in borderline "Normal" category
##D BMI_adjusted <- BMI - 20
##D 
##D thetahat <- c(Malnourished = 2.2, Normal = 1, Overweight = 1.8, 
##D               Obese = 2.5)
##D thetavar <- diag(c(0.1, 0.2, 0.2, 0.1))
##D rr       <- function(X, theta){
##D      
##D      #Create return vector with default risk of 1
##D      r_risk <- rep(1, nrow(X))
##D    
##D      #Assign categorical relative risk
##D      r_risk[which(X[,"Exposure"] < 0)]             <- theta[1] #Malnourished
##D      r_risk[intersect(which(X[,"Exposure"] >= 0), 
##D                       which(X[,"Exposure"] < 5))]  <- theta[2] #Normal
##D      r_risk[intersect(which(X[,"Exposure"] >= 5), 
##D                       which(X[,"Exposure"] < 10))] <- theta[3] #Overweight
##D      r_risk[which(X[,"Exposure"] >= 10)]           <- theta[4] #Obese
##D    
##D    return(r_risk)
##D }
##D 
##D paf.confidence(BMI_adjusted, thetahat, rr, thetavar, check_exposure = FALSE)
##D 
##D #Example 6: Bivariate exposure and rr ("classical PAF")
##D #------------------------------------------------------------------
##D set.seed(18427)
##D mysample  <- sample(c("Exposed","Unexposed"), 1000, 
##D                 replace = TRUE, prob = c(0.1, 0.9))
##D X         <- data.frame(Exposure = mysample)
##D theta     <- c("Exposed" = 2.5, "Unexposed" = 1.2)  
##D thetavar  <- matrix(c(0.04, 0.02, 0.02, 0.03), ncol = 2)
##D rr        <- function(X, theta){
##D    
##D    #Create relative risk function
##D    r_risk <- rep(1, nrow(X))
##D    
##D    #Assign values of relative risk
##D    r_risk[which(X[,"Exposure"] == "Unexposed")] <- theta["Unexposed"]
##D    r_risk[which(X[,"Exposure"] == "Exposed")]   <- theta["Exposed"]
##D    
##D    return(r_risk)
##D }    
##D 
##D paf.confidence(X, theta, rr, thetavar)
##D 
##D #Example 7: Continuous exposure, several covariates
##D #------------------------------------------------------------------
##D X <- data.frame(Exposure = rbeta(100, 2, 3),
##D                 Age      = runif(100, 20, 100),
##D                 Sex      = sample(c("M","F"), 100, replace = TRUE),
##D                 BMI      = rlnorm(100, 3.2, 0.2))
##D thetahat <- c(-0.1, 0.05, 0.2, -0.4, 0.3, 0.1)
##D 
##D #Create variance of theta
##D almostvar <- matrix(runif(6^2), ncol = 6)
##D thetavar  <- t(almostvar) %*% almostvar
##D rr <- function(X, theta){
##D      #Create risk vector
##D      Risk    <- rep(1, nrow(X))
##D      
##D      #Identify subpopulations
##D      males   <- which(X[,"Sex"] == "M")
##D      females <- which(X[,"Sex"] == "F")
##D      
##D      #Calculate population specific rr
##D      Risk[males] <- theta[1]*X[males,"Exposure"] + 
##D                                       theta[2]*X[males,"Age"]^2 + 
##D                                       theta[3]*X[males,"BMI"]/2 
##D                                      
##D      Risk[females] <- theta[4]*X[females,"Exposure"] + 
##D                                       theta[5]*X[females,"Age"]^2 + 
##D                                       theta[6]*X[females,"BMI"]/2 
##D                                      
##D     return(Risk)
##D }
##D 
##D paf.confidence(X, thetahat, rr, thetavar)
## End(Not run)



