library(BayesSAE)


### Name: BayesSAE
### Title: MCMC Draws Based on Area-Level Models
### Aliases: BayesSAE print.BayesSAE
### Keywords: Hierarchical Bayes

### ** Examples

# load data set
data(SAIPE)
m <- length(SAIPE$SACPR)

# basic Fay-Herriort models (FH)
result <- BayesSAE(SACPR~SNAPR+CenPR+CPER|Vardir, data = SAIPE, mcmc = 5000)

# You-Chapman models (YC)
result <- BayesSAE(SACPR~SNAPR+CenPR+CPER|Vardir, data = SAIPE, mcmc = 5000, innov = "t", 
    df = rep(50, m))
	
# spatial model with unknown sampling variance (SYC)
# define the neighbourhood matrix
prox <- cbind(sample(1:51, 50, replace = TRUE), sample(1:51, 50, replace = TRUE))
prox <- prox[prox[,1] != prox[,2], ]
result <- BayesSAE(SACPR~SNAPR+CenPR+CPER|Vardir, data = SAIPE, mcmc = 5000, innov = "t",
    df = rep(50, m), spatial = TRUE, prox = prox)

# Unmatched models (UFH)
result <- BayesSAE(SACPR~SNAPR+CenPR+CPER|Vardir, data = SAIPE, mcmc = 5000, tran = "log")	



