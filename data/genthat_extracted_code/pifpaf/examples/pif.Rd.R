library(pifpaf)


### Name: pif
### Title: Potential Impact Fraction
### Aliases: pif

### ** Examples


#Example 1: Exponential Relative Risk
#--------------------------------------------
set.seed(18427)
X        <- data.frame(Exposure = rnorm(100,3,1))
thetahat <- 0.12
rr       <- function(X, theta){exp(theta*X)}

#Without specifying counterfactual pif matches paf
pif(X, thetahat, rr)
paf(X, thetahat, rr)

#Same example with kernel method
pif(X, thetahat, rr, method = "kernel")

#Same example with approximate method
Xmean <- data.frame(Exposure = mean(X[,"Exposure"]))
Xvar  <- var(X[,"Exposure"])
pif(Xmean, thetahat, rr, method = "approximate", Xvar = Xvar)

#Same example considering counterfactual of halving exposure
cft   <- function(X){ 0.5*X }
pif(X, thetahat, rr, cft, method = "empirical")

#Example 2: Linear Relative Risk
#--------------------------------------------
set.seed(18427)
X        <- data.frame(Exposure = rbeta(100,3,1))
thetahat <- 0.12
rr       <- function(X, theta){theta*X + 1}
cft      <-  function(X){ 0.5*X }
weights             <- runif(100)
normalized_weights  <- weights/sum(weights)
pif(X, thetahat, rr, cft, weights = normalized_weights)

#Same example with more complex counterfactual that reduces 
#only the values > 0.75 are halved
cft       <- function(X){

   #Indentify the ones with "a lot" of exposure:
   where_excess_exposure    <- which(X[,"Exposure"] > 0.75)             
   
   #Halve their exposure
   X[where_excess_exposure, "Exposure"] <- 
            X[where_excess_exposure, "Exposure"]/2  
   return(X)
}
pif(X, thetahat, rr, cft, weights = normalized_weights)


#Example 3: Multivariate Linear Relative Risk
#--------------------------------------------
set.seed(18427)
X1       <- rnorm(100,4,1)
X2       <- rnorm(100,2,0.4)
X        <- data.frame(Exposure = X1, Covariate = X2)
thetahat <- c(0.12, 0.03)

#When creating relative risks and counterfactuals avoid using $ operator
#as it doesn't work under approximate method
rr_not    <- function(X, theta){
               exp(theta[1]*X$Exposure + theta[2]*X$Covariate)
             }
rr_better <- function(X, theta){
               exp(theta[1]*X[,"Exposure"] + theta[2]*X[,"Covariate"])
             }
                                     
#Creating a counterfactual. 
cft  <- function(X){
   Y               <- X
   Y[,"Exposure"]  <- 0.5*X[,"Exposure"]
   Y[,"Covariate"] <- 1.1*X[,"Covariate"] + 1
   return(Y)
}
pif(X, thetahat, rr_better, cft) 

#Same multivariate example for approximate method calculating 
#mean and variance
Xmean <- data.frame(Exposure = mean(X$Exposure), 
                   Covariate = mean(X$Covariate))
Xvar  <- var(X)
pif(Xmean, thetahat, rr_better, method = "approximate", Xvar = Xvar)

## Not run: 
##D #The one with $ operators doesn't work:
##D pif(Xmean, thetahat, rr_not, method = "approximate", Xvar = Xvar)
## End(Not run)
## Not run: 
##D #Warning: Multivariate cases cannot be evaluated with kernel method
##D pif(X, thetahat, rr_better, method = "kernel") 
## End(Not run)

#Example 4: Categorical Relative Risk & Exposure
#--------------------------------------------
set.seed(18427)
mysample  <- sample(c("Normal","Overweight","Obese"), 100, 
                   replace = TRUE, prob = c(0.4, 0.1, 0.5))
X        <- data.frame(Exposure = mysample)

thetahat <- c(1, 1.2, 1.5)

#Categorical relative risk function
rr <- function(X, theta){

   #Create return vector with default risk of 1
   r_risk <- rep(1, nrow(X))
   
   #Assign categorical relative risk
   r_risk[which(X[,"Exposure"] == "Normal")]      <- thetahat[1]
   r_risk[which(X[,"Exposure"] == "Overweight")]  <- thetahat[2]
   r_risk[which(X[,"Exposure"] == "Obese")]       <- thetahat[3]
   
   return(r_risk)
}

pif(X, thetahat, rr, check_rr = FALSE)

#Counterfactual of reducing all obesity to normality
cft <- function(X){
   X[which(X[,"Exposure"] == "Obese"),] <- "Normal"
   return(X)
}

pif(X, thetahat, rr, cft, check_rr = FALSE)

#Example 5: Categorical Relative Risk & continuous exposure
#----------------------------------------------------------
set.seed(18427)
BMI      <- data.frame(Exposure = rlnorm(100, 3.1, sdlog = 0.1))

#Theoretical minimum risk exposure is at 20kg/m^2 in borderline "Normal" category
BMI_adjusted <- BMI - 20

thetahat <- c(Malnourished = 2.2, Normal = 1, Overweight = 1.8, 
              Obese = 2.5)
              
rr       <- function(X, theta){
     
     #Create return vector with default risk of 1
     r_risk <- rep(1, nrow(X))
   
     #Assign categorical relative risk
     r_risk[which(X[,"Exposure"] < 0)]             <- theta[1] #Malnourished
     r_risk[intersect(which(X[,"Exposure"] >= 0), 
                      which(X[,"Exposure"] < 5))]  <- theta[2] #Normal
     r_risk[intersect(which(X[,"Exposure"] >= 5), 
                      which(X[,"Exposure"] < 10))] <- theta[3] #Overweight
     r_risk[which(X[,"Exposure"] >= 10)]           <- theta[4] #Obese
   
   return(r_risk)
}

#Counterfactual of everyone in normal range
cft <- function(bmi){
     bmi           <- data.frame(rep(2.5, nrow(bmi)), ncol = 1)
     colnames(bmi) <- c("Exposure")
     return(bmi)
}

pif(BMI_adjusted, thetahat, rr, cft, 
    check_exposure = FALSE, method = "empirical")


#Example 6: Bivariate exposure and rr ("classical PAF")
#------------------------------------------------------------------
set.seed(18427)
mysample  <- sample(c("Exposed","Unexposed"), 1000, 
                replace = TRUE, prob = c(0.1, 0.9))
X         <- data.frame(Exposure = mysample)
theta     <- c("Exposed" = 2.5, "Unexposed" = 1.2)   
rr        <- function(X, theta){
   
   #Create relative risk function
   r_risk <- rep(1, nrow(X))
   
   #Assign values of relative risk
   r_risk[which(X[,"Exposure"] == "Unexposed")] <- theta["Unexposed"]
   r_risk[which(X[,"Exposure"] == "Exposed")]   <- theta["Exposed"]
   
   return(r_risk)
}      

#Counterfactual of reducing the exposure in half of the individuals
cft <- function(X){

   #Find out which ones are exposed
   Xexp  <- which(X[,"Exposure"] == "Exposed")
   
   #Use only half of the exposed randomly
   reduc <- sample(Xexp, length(Xexp)/2)
   
   #Unexpose those individuals
   X[reduc, "Exposure"] <- "Unexposed"
   
   return(X)
}

pif(X, theta, rr, cft)

#Example 7: Continuous exposure, several covariates
#------------------------------------------------------------------
X <- data.frame(Exposure = rbeta(100, 2, 3),
                Age      = runif(100, 20, 100),
                Sex      = sample(c("M","F"), 100, replace = TRUE),
                BMI      = rlnorm(100, 3.2, 0.2))
thetahat <- c(-0.1, 0.05, 0.2, -0.4, 0.3, 0.1)

rr <- function(X, theta){
     #Create risk vector
     Risk    <- rep(1, nrow(X))
     
     #Identify subpopulations
     males   <- which(X[,"Sex"] == "M")
     females <- which(X[,"Sex"] == "F")
     
     #Calculate population specific rr
     Risk[males] <- theta[1]*X[males,"Exposure"] + 
                                      theta[2]*X[males,"Age"]^2 + 
                                      theta[3]*X[males,"BMI"]/2 
                                     
     Risk[females] <- theta[4]*X[females,"Exposure"] + 
                                      theta[5]*X[females,"Age"]^2 + 
                                      theta[6]*X[females,"BMI"]/2 
                                     
    return(Risk)
}

#Counterfactual of reducing BMI
cft <- function(X){
    excess_bmi           <- which(X[,"BMI"] > 25)
    X[excess_bmi,"BMI"]  <- 25
    return(X)
}

pif(X, thetahat, rr, cft)




