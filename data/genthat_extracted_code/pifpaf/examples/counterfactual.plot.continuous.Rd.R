library(pifpaf)


### Name: counterfactual.plot.continuous
### Title: Create a plot of the distribution of exposure under
###   counterfactual scenario for continuous exposure
### Aliases: counterfactual.plot.continuous
### Keywords: internal

### ** Examples


#Example 1: Normal distribution and linear counterfactual
#--------------------------------------------------------
set.seed(2783569)
X   <- data.frame(rnorm(1000, 150, 15))
cft <- function(X){0.35*X + 75}  
counterfactual.plot.continuous(X, cft, xlab = "Usual SBP (mmHg)", 
ylab = "Relative risk of ischaemic heart disease",
dnames = c("Current distribution", "Theoretical Minimum Risk Distribution"),
title = paste0("Effect of a non-linear hazard function and choice", 
               "\nof baseline on total population risk", 
               "\n(Fig 25 from Vander Hoorn et al)"))
  
#Example 2: Counterfactual of BMI reduction only for those with excess-weight (BMI > 25)
#--------------------------------------------------------
set.seed(2783569)
X <- data.frame(Exposure = rlnorm(1000, 3, 0.2))
cft <- function(X){

     #Find individuals with excess weight
     excess_weight <- which(X[,"Exposure"] > 25)
     
     #Set those with excess weight to BMI of 25
     X[excess_weight, "Exposure"] <- 22.5
     
     return(X)
}     

counterfactual.plot.continuous(X, cft, ktype = "epanechnikov")   

#Change bandwidth method to reduce noice
counterfactual.plot.continuous(X, cft, ktype = "epanechnikov", bw = "nrd0")   

#Focus on what happens to the exposure > 23 
counterfactual.plot.continuous(X, cft, ktype = "epanechnikov", bw = "nrd0",
fill_limits = c(23, Inf)) 

#Delete fill
counterfactual.plot.continuous(X, cft, ktype = "epanechnikov", bw = "nrd0", fill = FALSE)   
  



