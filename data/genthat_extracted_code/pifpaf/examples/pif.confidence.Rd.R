library(pifpaf)


### Name: pif.confidence
### Title: Confidence Intervals for the Potential Impact Fraction
### Aliases: pif.confidence

### ** Examples

#Example 1: Exponential Relative Risk
#--------------------------------------------
set.seed(18427)
X        <- data.frame(Exposure = rnorm(100,3,1))
thetahat <- 0.12
thetavar <- 0.02
rr       <- function(X, theta){exp(theta*X)}


#Counterfactual of halving exposure
cft   <- function(X){ 0.5*X }

#Using bootstrap method
pif.confidence(X, thetahat, rr, thetavar, cft)

## Not run: 
##D #Same example with loglinear method
##D pif.confidence(X, thetahat, rr, thetavar, cft, confidence_method = "loglinear")
##D 
##D #Same example with linear method (usually the widest and least precise)
##D pif.confidence(X, thetahat, rr, thetavar, cft, confidence_method = "linear")
##D 
##D 
##D #Example 2: Linear Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X        <- data.frame(Exposure = rbeta(100,3,1))
##D thetahat <- 0.17
##D thetavar <- 0.01
##D rr       <- function(X, theta){theta*X + 1}
##D cft      <- function(X){ 0.5*X }
##D weights             <- runif(100)
##D normalized_weights  <- weights/sum(weights)
##D pif.confidence(X, thetahat, rr, thetavar, cft, weights = normalized_weights)
##D 
##D #Same example with more complex counterfactual that reduces 
##D #only the values > 0.75 are halved
##D cft       <- function(X){
##D 
##D    #Indentify the ones with "a lot" of exposure:
##D    where_excess_exposure    <- which(X[,"Exposure"] > 0.75)             
##D    
##D    #Halve their exposure
##D    X[where_excess_exposure, "Exposure"] <- 
##D             X[where_excess_exposure, "Exposure"]/2  
##D    return(X)
##D }
##D pif.confidence(X, thetahat, rr, thetavar, cft, weights = normalized_weights)
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
##D #Creating a counterfactual. 
##D cft  <- function(X){
##D    Y               <- X
##D    Y[,"Exposure"]  <- 0.5*X[,"Exposure"]
##D    Y[,"Covariate"] <- 1.1*X[,"Covariate"] + 1
##D    return(Y)
##D }
##D 
##D pif.confidence(Xmean, thetahat, rr_better, thetavar, cft, 
##D method = "approximate", Xvar = Xvar) 
## End(Not run)

## Not run: 
##D #Error: $ operator in rr definitions don't work in approximate
##D pif.confidence(Xmean, thetahat, rr_not, thetavar, cft, method = "approximate", Xvar = Xvar)
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
##D 
##D #Counterfactual of reducing all obesity to normality
##D cft <- function(X){
##D    X[which(X[,"Exposure"] == "Obese"),] <- "Normal"
##D    return(X)
##D }
##D 
##D pif.confidence(X, thetahat, rr, thetavar, cft, check_rr = FALSE)
##D 
##D 
##D #Example 5: Categorical Relative Risk & continuous exposure
##D #----------------------------------------------------------
##D set.seed(18427)
##D BMI      <- data.frame(Exposure = rlnorm(100, 3.1, sdlog = 0.1))
##D 
##D #Theoretical minimum risk exposure is 20kg/m^2 in borderline "Normal" category
##D BMI_adjusted <- BMI - 20
##D 
##D thetahat <- c(Malnourished = 2.2, Normal = 1, Overweight = 1.8, 
##D               Obese = 2.5)
##D thetavar <- diag(c(0.1, 0.2, 0.2, 0.1))
##D 
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
##D #Counterfactual of everyone in normal range
##D cft <- function(bmi){
##D      bmi           <- data.frame(rep(2.5, nrow(bmi)), ncol = 1)
##D      colnames(bmi) <- c("Exposure")
##D      return(bmi)
##D }
##D 
##D pif.confidence(BMI_adjusted, thetahat, rr, thetavar, cft, 
##D                 check_exposure = FALSE, method = "empirical")
##D 
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
##D #Counterfactual of reducing the exposure in half of the individuals
##D cft <- function(X){
##D 
##D    #Find out which ones are exposed
##D    Xexp  <- which(X[,"Exposure"] == "Exposed")
##D    
##D    #Use only half of the exposed randomly
##D    reduc <- sample(Xexp, length(Xexp)/2)
##D    
##D    #Unexpose those individuals
##D    X[reduc, "Exposure"] <- "Unexposed"
##D    
##D    return(X)
##D }
##D 
##D pif.confidence(X, theta, rr, thetavar, cft)
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
##D 
##D thetavar <- t(almostvar) %*% almostvar
##D 
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
##D #Counterfactual of reducing BMI
##D cft <- function(X){
##D     excess_bmi           <- which(X[,"BMI"] > 25)
##D     X[excess_bmi,"BMI"]  <- 25
##D     return(X)
##D }
##D 
##D pif.confidence(X, thetahat, rr, thetavar, cft)
## End(Not run)



