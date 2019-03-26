library(NormalBetaPrime)


### Name: hsplus.normalmeans
### Title: Normal Means Estimation and Hypothesis Testing with the
###   Horseshoe+ Prior
### Aliases: hsplus.normalmeans

### ** Examples

###################################################
## Example on synthetic data.                    ## 
## 5 percent of entries in a sparse vector theta ##
## are set equal to signal value A =7.           ##
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

#################################
# Run the horseshoe+ model on X #
#################################
# For optimal performance, should set max.steps=10,000 and burnin=5000.

# Fix tau at 1/n
hsplus.model <- hsplus.normalmeans(X, tau.est="fixed", tau=1/length(X), 
                                  sigma2=1, var.select="threshold", 
                                  max.steps=1000, burnin=500)

hsplus.model$theta.intervals           # 95 percent credible intervals
hsplus.model$hsplus.classifications    # Classifications
hsplus.model$tau.estimate              # Estimate of sparsity level

## No test: 
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

###########################################
# Apply horseshoe+ model on the z-scores. #
# Here sigma2 is known with sigma2= 1     #
###########################################

hsplus.model <- hsplus.normalmeans(z.scores, tau.est="reml", var.select="threshold")

##########################################
# How many genes flagged as significant? #
##########################################
num.sig <- sum(hsplus.model$hsplus.classifications != 0)
num.sig

####################################################### 
# Estimated effect size for 10 most significant genes #
#######################################################
most.sig <- c(610,1720,332,364,914,3940,4546,1068,579,4331)
hsplus.model$theta.hat[most.sig]
## End(No test)




