library(IGG)


### Name: igg.normalmeans
### Title: Normal Means Estimation and Classification with the IGG Prior
### Aliases: igg.normalmeans

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

# Set (sparsity.level)% of them to be A
q <- floor(n*(sparsity.level/100))


# Pick random indices of theta.true to equal A
signal.indices <- sample(1:n, size=q, replace=FALSE)

#######################
# Generate true theta #
#######################
theta.true[signal.indices] <- A

####################################################### 
# Generate data X by corrupting theta.true with noise #
#######################################################
X <- theta.true + rnorm(n,0,1)

##########################
# Run the IGG model on X #
##########################
# For optimal performance, should set max.steps=10,000 and burnin=5000.

igg.model <- igg.normalmeans(X, var.select="threshold", max.steps=2000, burnin=1000)

################################ 
# Calculate mean squared error #
################################
igg.mse <- sum((igg.model$theta.med-theta.true)^2)/n
igg.mse

# To compute misclassification probability and false discovery rate
true.classifications <- rep(0,n)
signal.indicies <- which(theta.true != 0)
true.classifications[signal.indices] <- 1 
igg.classifications <- igg.model$igg.classifications

false.pos <- length(which(igg.classifications != 0 & true.classifications == 0))
num.pos <- length(which(igg.classifications != 0))
false.neg <- length(which(igg.classifications == 0 & true.classifications != 0))

########################################################
# Calculate FDR and misclassification probability (MP) #
########################################################
igg.fdr <- false.pos/num.pos
igg.fdr

igg.mp <- (false.pos+false.neg)/n
igg.mp

## Not run: 
##D #
##D #
##D ######################################################
##D ######################################################
##D ## Prostate cancer data analysis.                   ##
##D ## Running this code will allow you to reproduce    ##
##D ## the results in Section 6 of Bai and Ghosh (2018) ##
##D ######################################################
##D ######################################################
##D 
##D # Load the data
##D data(singh2002)
##D attach(singh2002)
##D 
##D # Only look at the gene expression data.
##D # First 50 rows are the cancer patients,
##D # and the last 52 rows are the control subjects.d
##D 
##D prostate.data <- singh2002$x
##D 
##D # Perform 2-sample t-test and obtain z-scores
##D n <- ncol(prostate.data)
##D test.stat <- rep(NA,n)
##D z.scores <- rep(NA, n)
##D 
##D # Fill in the vectors
##D for(i in 1:n){
##D   test.stat[i] <- t.test(prostate.data[51:102,i], 
##D                         prostate.data[1:50,i])$statistic
##D   z.scores[i] <- qnorm(pt(test.stat[i],100))
##D }
##D 
##D 
##D #######################################
##D # Apply IGG model on the z-scores.    #
##D # Here sigma2 is known with sigma2= 1 #
##D #######################################
##D 
##D igg.model <- igg.normalmeans(z.scores, sigma2=1, var.select="threshold")
##D 
##D ##########################################
##D # How many genes flagged as significant? #
##D ##########################################
##D num.sig <- sum(igg.model$igg.classifications != 0)
##D num.sig
##D 
##D ####################################################### 
##D # Estimated effect size for 10 most significant genes #
##D #######################################################
##D most.sig <- c(610,1720,332,364,914,3940,4546,1068,579,4331)
##D igg.model$theta.hat[most.sig]
## End(Not run)




