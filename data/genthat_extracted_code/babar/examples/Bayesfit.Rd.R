library(babar)


### Name: Bayesfit
### Title: Bayesfit
### Aliases: Bayesfit

### ** Examples

B092_1.file <- system.file("extdata", "B092_1.csv", package = "babar")
data <- read.csv(B092_1.file, header=TRUE, sep=",",
                 na.strings=c("ND","NA"))

# Get a quick approximation of the evidence/model parameters.
results.linear.short <- Bayesfit(data,model="linear",inf.sigma=FALSE,
                                 tol=10,prior.size=25)

# Compute a better estimate of the evidence/model parameters (slow so not
# run as part of the automated examples).
## Not run: 
##D results.linear.full <- Bayesfit(data,model="linear",inf.sigma=FALSE)
## End(Not run)



