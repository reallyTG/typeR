library(pifpaf)


### Name: paf
### Title: Population Attributable Fraction
### Aliases: paf

### ** Examples


#Example 1: Exponential Relative Risk
#--------------------------------------------
set.seed(18427)
X        <- data.frame(Exposure = rnorm(100,3,1))
thetahat <- 0.12
rr       <- function(X, theta){exp(theta*X)}

#Using the empirical method
paf(X, thetahat, rr)

#Same example with kernel method
paf(X, thetahat, rr, method = "kernel")

#Same example with approximate method
Xmean <- data.frame(Exposure = mean(X[,"Exposure"]))
Xvar  <- var(X[,"Exposure"])
paf(Xmean, thetahat, rr, method = "approximate", Xvar = Xvar)

#Additional options for approximate:
paf(Xmean, thetahat, rr, method = "approximate", Xvar = Xvar, 
   deriv.method = "Richardson",  deriv.method.args = list(eps=1e-3, d=0.1))

#Example 2: Linear Relative Risk with weighted sample
#--------------------------------------------
set.seed(18427)
X                   <- data.frame(Exposure = rbeta(100,3,1))
weights             <- runif(100)
normalized_weights  <- weights/sum(weights)
thetahat            <- 0.12
rr                  <- function(X, theta){theta*X^2 + 1}
paf(X, thetahat, rr, weights = normalized_weights)

   
#Additional options for kernel:
paf(X, thetahat, rr, weights = normalized_weights, 
     method = "kernel", ktype = "cosine", bw = "nrd0")


#Example 3: Multivariate Linear Relative Risk
#--------------------------------------------
set.seed(18427)
X1       <- rnorm(100,4,1)
X2       <- rnorm(100,2,0.4)
X        <- data.frame(Exposure = X1, Covariate = X2)
thetahat <- c(0.12, 0.03)

#When creating relative risks avoid using the $ operator
#as it doesn't work under approximate method
rr_not    <- function(X, theta){
               exp(theta[1]*X$Exposure + theta[2]*X$Covariate)
             }
rr_better <- function(X, theta){
               exp(theta[1]*X[,"Exposure"] + theta[2]*X[,"Covariate"])
             }
             
#For the empirical method it makes no difference:              
paf(X, thetahat, rr_better) 
paf(X, thetahat, rr_not) 


#But the approximate method crashes due to operator
Xmean <- data.frame(Exposure = mean(X[,"Exposure"]), 
                    Covariate = mean(X[,"Covariate"]))
Xvar  <- var(X)

paf(Xmean, thetahat, rr_better, method = "approximate", Xvar = Xvar)
## Not run: 
##D #Error: $ operator in rr definitions don't work in approximate
##D paf(Xmean, thetahat, rr_not, method = "approximate", Xvar = Xvar)
## End(Not run)


## Not run: 
##D #Error: Multivariate cases cannot be evaluated with kernel method
##D paf(X, thetahat, rr, method = "kernel") 
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

paf(X, thetahat, rr, check_rr = FALSE)

#Example 5: Continuous Exposure and Categorical Relative Risk
#------------------------------------------------------------------
set.seed(18427)

#Assume we have BMI from a sample
BMI          <- data.frame(Exposure = rlnorm(100, 3.1, sdlog = 0.1))

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

paf(BMI_adjusted, thetahat, rr, check_exposure = FALSE)

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

paf(X, theta, rr)

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

paf(X, thetahat, rr)





