library(RSGHB)


### Name: doHB
### Title: Estimate a Hierarchical Bayesian Model
### Aliases: doHB
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Organize choicedata for modeling
data(choicedata)
tt1 <- choicedata$tt1
tt2 <- choicedata$tt2
toll2 <- choicedata$toll2
choice1 <- (choicedata$Choice==1)
choice2 <- (choicedata$Choice==2)

# The model likelihood function
likelihood <- function(fc, b) {  
     
     # Assign Beta vectors to named parameters for convenience
     cc    <- 1
     wtp1  <- b[, cc]; cc <- cc + 1
     price <- b[, cc]; cc <- cc + 1
     
     # Discrete choice utility in WTP-space
     v1 <-                 price * wtp1 * tt1
     v2 <- price * toll2 + price * wtp1 * tt2
     
     # Return the probability of choice
     p  <- (exp(v1)*choice1 + exp(v2)*choice2) / (exp(v1) + exp(v2))
     return(p)
}

# Estimation controls/settings
control <- list(
     modelname = "MNL_WTPSpace",
     gVarNamesNormal = c("WTP", "Price"),
     gNCREP = 300,
     gNEREP = 100,
     gINFOSKIP = 10,
     gNSKIP = 2,
     nodiagnostics = TRUE
)

# Estimate the model
set.seed(1987)
     ## No test: 
          model <- doHB(likelihood, choicedata, control)
     
## End(No test)



