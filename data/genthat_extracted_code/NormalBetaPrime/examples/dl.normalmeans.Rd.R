library(NormalBetaPrime)


### Name: dl.normalmeans
### Title: Normal Means Estimation and Hypothesis Testing with the
###   Dirichlet-Laplace Prior
### Aliases: dl.normalmeans

### ** Examples

###################################################
###################################################
## Example on synthetic data.                    ## 
## 5 percent of entries in a sparse vector theta ##
## are set equal to signal value A =7.           ##
###################################################
###################################################
n <- 100
sparsity.level <- 5
A <- 7

# Initialize theta vector of all zeros
theta.true <- rep(0,n)
# Set (sparsity.level) percent of them to be A
q <- floor(n*(sparsity.level/100))
# Pick random indices of theta.true to equal A
signal.indices <- sample(1:n, size=q, replace=FALSE)

###################
# Generate data X #
###################
theta.true[signal.indices] <- A
X <- theta.true + rnorm(n,0,1)

#########################
# Run the DL model on X #
#########################
# For optimal performance, should set max.steps=10,000 and burnin=5000.

# Estimate b from the empirical Bayes estimate of sparsity level
dl.model <- dl.normalmeans(X, a.est="est.sparsity", sigma2=1, var.select="threshold", 
                          max.steps=1000, burnin=500)

dl.model$theta.med           # Posterior median estimates
dl.model$dl.classifications  # Classifications
dl.model$a.estimate          # Estimate of sparsity level

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
# Apply DL model on the z-scores.     #
# Here sigma2 is known with sigma2= 1 #
#######################################

dl.model <- dl.normalmeans(z.scores, a.est="reml", var.select="threshold")

##########################################
# How many genes flagged as significant? #
##########################################
num.sig <- sum(dl.model$dl.classifications != 0)
num.sig

####################################################### 
# Estimated effect size for 10 most significant genes #
#######################################################
most.sig <- c(610,1720,332,364,914,3940,4546,1068,579,4331)
dl.model$theta.hat[most.sig]
## End(No test)




