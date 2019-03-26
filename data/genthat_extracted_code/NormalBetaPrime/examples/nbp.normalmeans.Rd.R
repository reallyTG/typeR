library(NormalBetaPrime)


### Name: nbp.normalmeans
### Title: Normal Means Estimation and Hypothesis Testing with the NBP
###   Prior
### Aliases: nbp.normalmeans

### ** Examples


##################################################
# Example on synthetic data.                     # 
# 5 percent of entries in a sparse vector theta  #
# are set equal to signal value A = 7.           #
##################################################
n <- 40
sparsity.level <- 5    # 5 percent of entries will be nonzero
A <- 5
# Initialize theta vector of all zeros
theta.true <- rep(0,n)
# Set (sparsity.level) percent of them to be A
q <- floor(n*(sparsity.level/100))
signal.indices <- sample(1:n, size=q, replace=FALSE)

###################
# Generate data X #
###################
theta.true[signal.indices] <- A
X <- theta.true + rnorm(n,0,1)

##########################
# Run the NBP model on X #
##########################
# For optimal performance, should set max.steps=10,000 and burnin=5000.
# Estimate b based on REML
nbp.model <- nbp.normalmeans(X, b.est="reml", sigma2=1, var.select="threshold", 
                            max.steps=1000, burnin=500)

nbp.model$theta.hat           # Posterior mean estimates
nbp.model$theta.intervals     # Posterior credible intervals
nbp.model$nbp.classifications # Classifications
nbp.model$b.estimate          # Estimate of sparsity level

## No test: 
#
#
######################################################
######################################################
## Prostate cancer data analysis.                   ##
## Running this code will allow you to reproduce    ##
## the results in Section 6 of Bai and Ghosh (2018) ##
######################################################
######################################################
# Load the data
data(singh2002)
attach(singh2002)

# First 50 rows are the cancer patients,
# and the last 52 rows are the control subjects.

prostate.data <- singh2002$x

# Perform 2-sample t-test and obtain z-scores
n <- ncol(prostate.data)
test.stat <- rep(NA,n)
z.scores <- rep(NA, n)

# Fill in the vectors
for(i in 1:n){
  test.stat[i] <- t.test(prostate.data[51:102,i], 
                        prostate.data[1:50,i])$statistic
  z.scores[i] <- qnorm(pt(test.stat[i],100))
}

#######################################
# Apply NBP model on the z-scores.    #
# Here sigma2 is known with sigma2= 1 #
#######################################

nbp.model <- nbp.normalmeans(z.scores, b.est="reml", var.select="threshold")

##########################################
# How many genes flagged as significant? #
##########################################
num.sig <- sum(nbp.model$nbp.classifications != 0)
num.sig

####################################################### 
# Estimated effect size for 10 most significant genes #
#######################################################
most.sig <- c(610,1720,332,364,914,3940,4546,1068,579,4331)
nbp.model$theta.hat[most.sig]
## End(No test)




